import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  initFCM() async {
    await _firebaseMessaging.requestPermission();

    final fcmToken = await _firebaseMessaging.getToken();
    print("FCM Token: $fcmToken");

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    await _firebaseMessaging.subscribeToTopic('allUsers');

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