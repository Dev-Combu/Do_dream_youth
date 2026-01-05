import 'package:do_dream_youth/presentation/config/notifications/notification_provider.dart';
import 'package:do_dream_youth/presentation/config/user_info/user_info_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationViewModel extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<void> updateAllAndSync(bool isEnabled) async {
    final usecase = ref.read(notificationUsecaseProvider);
    final userDepartment = ref.read(userInfoViewModelProvider).value?.department;
    List<String> topics = [];
    if(userDepartment != null) {
      if(userDepartment.contains('중학교')){
        topics.add('middleSchoolUsers');
      } else if (userDepartment.contains('고등학교')) {
        topics.add('highSchoolUsers');
      }
      topics.add('allUsers');
    }
    await usecase.saveNotificationsTopics(topics);
    await usecase.setNotificationStatus(isEnabled);
    await usecase.sendNotificationStatus(); // 최종적으로 Firebase에 반영
  }

  Future<bool> getNotificationStatus() {
    final notificationUsecase = ref.read(notificationUsecaseProvider);
    return notificationUsecase.getNotificationStatus();
  }

}

 final notificationViewModelProvider =
    NotifierProvider<NotificationViewModel, void>(NotificationViewModel.new);
