import 'package:do_dream_youth/data/source/notification_data_source.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationDataSourceImpl implements NotificationDataSource {
  Logger log = Logger();

  // 알림 설정 상태 저장
  @override
  Future<void> saveNotificationsTopics(List<String> notificationTopics) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setStringList('topics', notificationTopics);
  }

  // 알림 설정 상태 불러오기
  @override
  Future<bool> setNotificationStatus(bool state) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool('NOTIF_ENABLED', state);
    return state;
  }

  @override
  Future<void> sendNotificationStatus() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final notifStatus = sharedPrefs.getBool('NOTIF_ENABLED') ?? true;
    final notifTopics = sharedPrefs.getStringList('topics') ?? [];
    try {
      if (notifStatus) {
        // 알림을 켤 때: 기본 토픽 재구독 혹은 기존 저장된 토픽들 재구독
        for (var topic in notifTopics) {
          await FirebaseMessaging.instance.subscribeToTopic(topic);
        }
      } else {
        // 알림을 끌 때: 토픽 구독 해제
        for (var topic in notifTopics) {
          await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
        }
      }
    } catch (e) {
      log.i("Error in sendNotificationStatus: $e");
    }
  }
  
  @override
  Future<bool> getNotificationStatus() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    final notificationsStatus = sharedPrefs.getBool('NOTIF_ENABLED') ?? true;
    return notificationsStatus;
  }
}
