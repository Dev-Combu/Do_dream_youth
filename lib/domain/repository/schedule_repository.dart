import 'package:do_dream_youth/domain/entity/schedule_entity.dart';

abstract interface class ScheduleRepository {
  Stream<List<ScheduleEntity>> readSchedule();
  Future<void> createSchedule(ScheduleEntity scheduleInfo);
  Future<void> updateSchedule(ScheduleEntity scheduleInfo, String scheduleId);
  Future<void> deleteSchedule(String scheduleId);
}