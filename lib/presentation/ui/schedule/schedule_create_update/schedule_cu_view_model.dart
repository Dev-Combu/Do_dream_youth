import 'package:do_dream_youth/domain/entity/schedule_entity.dart';
import 'package:do_dream_youth/presentation/ui/schedule/schedule_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleCuViewModel extends Notifier<ScheduleEntity?>{
  @override
  ScheduleEntity? build() {
    
    return null;
  }

  Future<void> createSchedule(ScheduleEntity scheduleInfo) async{
    return await ref.read(fetchscheduleUsecaseProvider).createSchedule(scheduleInfo);
  }

  Future<void> updateSchedule(ScheduleEntity scheduleInfo, String scheduleId) async{
    return await ref.read(fetchscheduleUsecaseProvider).updateSchedule(scheduleInfo, scheduleId);
  }
}

final scheduleViewModel = NotifierProvider<ScheduleCuViewModel, ScheduleEntity?>(
    () => ScheduleCuViewModel());