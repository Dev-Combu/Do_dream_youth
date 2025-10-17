import 'package:do_dream_youth/data/source/schedule_data_source.dart';
import 'package:do_dream_youth/domain/entity/schedule_entity.dart';
import 'package:do_dream_youth/domain/repository/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository{
  ScheduleRepositoryImpl(this._scheduleDataSource);
  final ScheduleDataSource _scheduleDataSource;

  @override
  Stream<List<ScheduleEntity>> readSchedule() {
    final result = _scheduleDataSource.readBook();
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
}
