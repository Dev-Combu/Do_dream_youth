import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

Future<void> initFCM() async {
  // 1. 권한 요청 (iOS 필수)
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  final fcmToken = await _firebaseMessaging.getToken();
    print("FCM Token: $fcmToken");

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    
    // 2. iOS 전용: APNs 토큰이 준비될 때까지 대기
    // 토픽 구독도 이 토큰이 있어야 내부적으로 성공합니다.
    if (Platform.isIOS) {
      String? apnsToken;
      int retryCount = 0;
      while (apnsToken == null && retryCount < 5) {
        apnsToken = await _firebaseMessaging.getAPNSToken();
        if (apnsToken == null) {
          await Future.delayed(const Duration(seconds: 1));
          retryCount++;
        }
      }
    }

    // 3. 토픽 구독 (getToken()을 직접 호출하지 않아도 내부적으로 사용함)
    try {
      await _firebaseMessaging.subscribeToTopic('allUsers');
      print("모든 사용자 토픽 구독 완료");
    } catch (e) {
      print("토픽 구독 실패: $e");
    }
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification?.title} - ${message.notification?.body}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message: ${message.notification?.title}');
    });
  }
}
