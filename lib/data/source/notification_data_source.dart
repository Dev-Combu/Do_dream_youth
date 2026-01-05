abstract interface class NotificationDataSource {
  Future<void> saveNotificationStatus(bool isEnabled);
  bool getNotificationStatus();
}