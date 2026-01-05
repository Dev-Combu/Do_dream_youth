abstract interface class NotificationRepository {
  Future<void> saveNotificationsTopics(List<String> notificationTopics);
  Future<bool> setNotificationStatus(bool state);
  Future<void> sendNotificationStatus();
  Future<bool> getNotificationStatus();
}