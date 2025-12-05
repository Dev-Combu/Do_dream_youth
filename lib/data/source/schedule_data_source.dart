import 'package:do_dream_youth/data/dto/schedule/schedule_dto.dart';

abstract interface class ScheduleDataSource {
  Stream<List<ScheduleDto>> readSchedule();

  Future<void> createSchedule(ScheduleDto scheduleInfo);
}
