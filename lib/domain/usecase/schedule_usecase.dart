import 'package:do_dream_youth/domain/entity/schedule_entity.dart';
import 'package:do_dream_youth/domain/repository/schedule_repository.dart';

class ScheduleUsecase {
  ScheduleUsecase(this._scheduleRepository);
  final ScheduleRepository _scheduleRepository;

  Stream<List<ScheduleEntity>?> readSchedule() {
    return _scheduleRepository.readSchedule();
  }

  Future<void> createSchedule(ScheduleEntity scheduleInfo) async {
    return await _scheduleRepository.createSchedule(scheduleInfo);
  }
}