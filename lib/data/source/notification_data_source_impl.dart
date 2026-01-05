import 'package:do_dream_youth/data/source/notification_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationDataSourceImpl implements NotificationDataSource {
  final SharedPreferences sharedPreferences;

  NotificationDataSourceImpl({required this.sharedPreferences});

  // 알림 설정 상태 저장
  @override
  Future<void> saveNotificationStatus(bool isEnabled) async {
    await sharedPreferences.setBool('NOTIF_ENABLED', isEnabled);
  }

  // 알림 설정 상태 불러오기
  @override
  bool getNotificationStatus() {
    return sharedPreferences.getBool('NOTIF_ENABLED') ?? true;
  }
}