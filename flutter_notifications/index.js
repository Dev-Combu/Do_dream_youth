const {onCall, HttpsError} = require("firebase-functions/v2/https");
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const {onSchedule} = require("firebase-functions/v2/scheduler");
const dayjs = require("dayjs");
const utc = require("dayjs/plugin/utc"); // utc 변수 정의
const timezone = require("dayjs/plugin/timezone"); // timezone 변수 정의

// 정의한 변수를 extend에 넣어줍니다.
dayjs.extend(utc);
dayjs.extend(timezone);

admin.initializeApp();

// ⭐️ Firestore 인스턴스 초기화
const db = admin.firestore();


exports.setUserRoleClaim = functions.https.onCall(async (data, context) => {
  // ⭐️ 관리자 권한 확인 (선택 사항이나 보안상 강력 권장)
  if (!context.auth || context.auth.token.role !== "admin") {
    throw new functions.https.HttpsError(
        "permission-denied",
        "관리자만 사용자 역할을 설정할 수 있습니다.",
    );
  }

  const targetUid = data.uid; // 역할 부여 대상 사용자의 UID
  const roleToSet = data.role; // 부여할 역할 (예: "teacher", "admin")

  // 2. setCustomUserClaims 함수를 사용하여 클레임 설정
  try {
    await admin.auth().setCustomUserClaims(targetUid, {
      role: roleToSet,
    });

    // 2. ⭐️ 대상 사용자의 FCM 토큰을 DB에서 가져옵니다.
    //    (사용자의 FCM 토큰이 Firestore/DB에 저장되어 있다고 가정)
    const userDoc = await db.collection("users").doc(targetUid).get();
    const userData = userDoc.data();
    const fcmToken = userData && userData.fcmToken ? userData.fcmToken : null;
    if (fcmToken) {
      const renewalMessage = {
        data: {
          // ⭐️ 클라이언트(Flutter)가 이 메시지를 받으면 토큰 갱신 작업을 하도록 지시
          type: "TOKEN_RENEWAL_REQUIRED",
          role: roleToSet,
        },
        token: fcmToken, // 갱신 신호를 보낼 대상 기기
      };

      try {
        await admin.messaging().send(renewalMessage);
        console.log(`✅ ${targetUid}에게 토큰 갱신 유도 메시지 전송 성공.`);
      } catch (msgError) {
        console.error(`❌ ${targetUid}에게 메시지 전송 실패:`, msgError);
      }
    }

    return {
      success: true,
      message: `${targetUid}에게 ${roleToSet} 역할 클레임이 부여되었습니다.`,
    };
  } catch (error) {
    console.error("클레임 설정 실패:", error);
    throw new functions.https.HttpsError(
        "internal",
        "클레임 설정 중 오류 발생",
    );
  }
});


exports.sendMassNotification = onCall(async (request) => {
  const data = request.data;
  const auth = request.auth;

  // 인증 체크
  if (!auth || !auth.token) {
    throw new HttpsError("unauthenticated", "로그인이 필요합니다.");
  }

  // 역할 확인
  const allowedRoles = ["admin", "teacher"];
  const userRole = auth.token.role;

  if (!userRole || !allowedRoles.includes(userRole)) {
    throw new HttpsError("permission-denied", "권한이 없습니다.");
  }

  const title = data.title;
  const body = data.body;

  if (!title || !body) {
    throw new HttpsError("invalid-argument", "제목과 내용을 입력하세요.");
  }

  const msg = {
    notification: {title, body},
    topic: "allUsers",
  };

  await admin.messaging().send(msg);

  return {success: true};
});

exports.sendScheduleNotification = onCall(async (request) => {
  const data = request.data;
  const auth = request.auth;

  // 인증 체크
  if (!auth || !auth.token) {
    throw new HttpsError("unauthenticated", "로그인이 필요합니다.");
  }

  // 역할 확인
  const allowedRoles = ["admin", "teacher"];
  const userRole = auth.token.role;

  if (!userRole || !allowedRoles.includes(userRole)) {
    throw new HttpsError("permission-denied", "권한이 없습니다.");
  }

  const title = data.title;
  const body = data.body;
  const topicList = data.topics;
  const sendTime = data.sendTime;
  const finalSendTime = dayjs.tz(sendTime, "Asia/Seoul").toDate();
  const additionalPayload = data.payload || {};

  if (!topicList || !Array.isArray(topicList) || topicList.length === 0) {
    throw new functions.https.HttpsError(
        "invalid-argument",
        "topicList must be a non-empty array.",
    );
  }
  if (!title || typeof title !== "string" || title.trim() === "") {
    throw new HttpsError("invalid-argument", "제목을 입력하세요.");
  }
  if (!body || typeof body !== "string" || body.trim() === "") {
    throw new HttpsError("invalid-argument", "내용을 입력하세요.");
  }

  for (const topic of topicList) {
    const message = {
      notification: {
        title: title,
        body: body,
      },
      data: {
        ...additionalPayload,
        notificationType: "scheduleUpdate",
        topic: topic,
      },
      topic: topic,
    };

    if (sendTime) {
      try {
        const scheduledDoc = await db
            .collection("scheduled_notifications")
            .add({
              message: message,
              sendTime: new Date(finalSendTime), // Date 객체로 변환하여 저장
              status: "pending",
              createdAt: admin.firestore.FieldValue.serverTimestamp(),
              createdBy: auth.uid,
            });

        console.log(`✅ 알림 예약 성공: Document ID: ${scheduledDoc.id}`);
        return {
          success: true,
          scheduled: true,
          message: "알림이 성공적으로 예약되었습니다.",
          scheduleId: scheduledDoc.id,
        };
      } catch (error) {
        console.error("❌ 알림 예약 중 오류 발생:", error);
        throw new HttpsError("internal", "알림 예약 중 오류가 발생했습니다.");
      }
    } else {
      // 예약 시간이 없으면 즉시 발송 (기존 로직)
      try {
        const response = await admin.messaging().send(message);
        console.log("Schedule notification successfully:", response.messageId);
        return {
          success: true,
          messageId: response.messageId,
          scheduled: false,
        };
      } catch (error) {
        console.error(`Error sending schedule notification "${topic}":`, error);
        throw new HttpsError(
            "internal",
            "일정 알림 발송 중 오류가 발생했습니다.",
            error.message,
        );
      }
    }
  }
});

exports.scheduleNotificationProcessor = onSchedule({
  schedule: "*/1 * * * *", // 매 1분마다 실행 (Cron 구문: */1 * * * *)
  timeZone: "Asia/Seoul",
}, async (event) => {
  console.log("🔥 예약 알림 프로세서 실행.");
  const now = new Date();

  const snapshot = await db.collection("scheduled_notifications")
      .where("status", "==", "pending")
      .where("sendTime", "<=", now)
      .limit(100)
      .get();

  if (snapshot.empty) {
    console.log("예약된 알림이 없습니다.");
    return null;
  }

  const sendPromises = [];
  const deletePromises = [];

  snapshot.docs.forEach((doc) => {
    const scheduledData = doc.data();
    const fcmMessage = scheduledData.message;

    // FCM 발송 처리
    const sendPromise = admin.messaging().send(fcmMessage)
        .then((response) => {
          console.log(`[SUCCESS] 예약 알림 전송: ${doc.id} / ${response.messageId}`);
        })
        .catch((error) => {
          console.error(`[ERROR] 예약 알림 전송 실패: ${doc.id}`, error);
        });
    sendPromises.push(sendPromise);
    // 발송 후 문서 삭제 예약
    deletePromises.push(doc.ref.delete());
  });

  // 모든 알림 발송 및 삭제를 기다립니다.
  await Promise.all(sendPromises);
  await Promise.all(deletePromises);

  console.log(`✅ 총 ${snapshot.size}개의 예약 알림 처리 완료.`);
  return null;
});
