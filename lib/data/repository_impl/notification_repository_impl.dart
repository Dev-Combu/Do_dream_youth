import 'package:do_dream_youth/data/source/notification_data_source.dart';
import 'package:do_dream_youth/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource _notificationDataSource;
  NotificationRepositoryImpl(this._notificationDataSource);
  

  
  @override
  Future<void> saveNotificationStatus(bool isEnabled) {
    return _notificationDataSource.saveNotificationStatus(isEnabled);
  }
  
  @override
  bool getNotificationStatus() {
    // TODO: implement getNotificationStatus
    throw UnimplementedError();
  }

}