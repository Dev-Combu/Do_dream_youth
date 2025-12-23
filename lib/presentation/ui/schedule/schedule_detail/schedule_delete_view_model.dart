import 'package:do_dream_youth/presentation/ui/schedule/schedule_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleDeleteViewModel extends Notifier<String?>{
  @override
  String? build() {
    return null;
  }
    void deleteSchedule(String id) async {
    await ref.read(fetchscheduleUsecaseProvider).deleteSchedule(id);
  }
}

final scheduleDeleteViewModel = NotifierProvider<ScheduleDeleteViewModel, String?>(
    () => ScheduleDeleteViewModel());