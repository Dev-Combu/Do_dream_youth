abstract interface class NotificationRepository {
  Future<void> saveNotificationStatus(bool isEnabled);
  bool getNotificationStatus();
}