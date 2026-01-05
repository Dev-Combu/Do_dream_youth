import 'package:do_dream_youth/data/source/notification_data_source.dart';
import 'package:do_dream_youth/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource _notificationDataSource;
  NotificationRepositoryImpl(this._notificationDataSource);
  
  @override
  Future<void> saveNotificationsTopics(List<String> notificationTopics) {
    return _notificationDataSource.saveNotificationsTopics(notificationTopics);
  }
  
  @override
  Future<bool> setNotificationStatus(bool state) {
    return _notificationDataSource.setNotificationStatus(state);
  }

  @override
  Future<void> sendNotificationStatus() {
    return _notificationDataSource.sendNotificationStatus();
  }

  @override
  Future<bool> getNotificationStatus() {
    return _notificationDataSource.getNotificationStatus();
  }
}