import 'package:do_dream_youth/domain/repository/notification_repository.dart';

class NotificationUsecase {
  final NotificationRepository _notificationRepository;
  NotificationUsecase(this._notificationRepository);

  Future<void> saveNotificationsTopics(List<String> notificationTopics) {
    return _notificationRepository.saveNotificationsTopics(notificationTopics);
  }

  Future<bool> setNotificationStatus(bool state) {
    return _notificationRepository.setNotificationStatus(state);
  }

  Future<void> sendNotificationStatus() {
    return _notificationRepository.sendNotificationStatus();
  }

  Future<bool> getNotificationStatus() {
    return _notificationRepository.getNotificationStatus();
  }
}