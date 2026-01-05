import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Logger log = Logger();

  Future<void> initFCM() async {
    final sharedPrefs = await SharedPreferences.getInstance();

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
      final notifStatus = sharedPrefs.getBool('NOTIF_ENABLED') ?? true;
      final notifTopics = sharedPrefs.getStringList('topics') ?? [];
      try {
        if (notifStatus) {
          // 알림을 켤 때: 기본 토픽 재구독 혹은 기존 저장된 토픽들 재구독
          for (var topic in notifTopics) {
            await FirebaseMessaging.instance.subscribeToTopic(topic);
            log.i("Subscribed to topic: $topic");
          }
        } else {
          // 알림을 끌 때: 토픽 구독 해제
          for (var topic in notifTopics) {
            await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
            log.i("Unsubscribed from topic: $topic");
          }
        }
      } catch (e) {
        log.i("Error in sendNotificationStatus: $e");
      }
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
          'Message also contained a notification: ${message.notification?.title} - ${message.notification?.body}',
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message: ${message.notification?.title}');
    });
  }
}
