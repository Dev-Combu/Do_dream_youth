import 'package:do_dream_youth/data/dto/schedule/schedule_dto.dart';
import 'package:do_dream_youth/data/source/schedule_data_source.dart';
import 'package:do_dream_youth/domain/entity/schedule_entity.dart';
import 'package:do_dream_youth/domain/repository/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository{
  ScheduleRepositoryImpl(this._scheduleDataSource);
  final ScheduleDataSource _scheduleDataSource;

  @override
  Stream<List<ScheduleEntity>> readSchedule() {
    final result = _scheduleDataSource.readSchedule();
    return result.map((list) {
      return list
          .map(
            (e) => ScheduleEntity(
              name: e.name,
              startDate: e.startDate,
              endDate: e.endDate,
              target: e.target,
              description: e.description,
            ),
          )
          .toList();
    });
  }
  
  @override
  Future<void> createSchedule(ScheduleEntity scheduleInfo) async{
    return await _scheduleDataSource.createSchedule(
      ScheduleDto(
        name: scheduleInfo.name,
        startDate: scheduleInfo.startDate,
        endDate: scheduleInfo.endDate,
        target: scheduleInfo.target,
        description: scheduleInfo.description,
      ),
    );
  }
}
