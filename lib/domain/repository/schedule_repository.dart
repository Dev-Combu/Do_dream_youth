import 'package:do_dream_youth/domain/entity/schedule_entity.dart';

abstract interface class ScheduleRepository {
  Stream<List<ScheduleEntity>> readSchedule();
}