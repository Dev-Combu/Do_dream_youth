import 'package:do_dream_youth/domain/repository/notification_repository.dart';

class NotificationUsecase {
  final NotificationRepository _notificationRepository;
  NotificationUsecase(this._notificationRepository);

  Future<void> saveNotificationStatus(bool isEnabled) {
    return _notificationRepository.saveNotificationStatus(isEnabled);
  }

  bool getNotificationStatus() {
    return _notificationRepository.getNotificationStatus();
  }
}