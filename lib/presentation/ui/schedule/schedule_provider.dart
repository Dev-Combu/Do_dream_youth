import 'package:do_dream_youth/data/repository_impl/schedule_repository_impl.dart';
import 'package:do_dream_youth/data/source/schedule_data_source.dart';
import 'package:do_dream_youth/data/source/schedule_data_source_impl.dart';
import 'package:do_dream_youth/domain/repository/schedule_repository.dart';
import 'package:do_dream_youth/domain/usecase/schedule_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scheduleDataSourceProvider = Provider<ScheduleDataSource>((ref) {
  return ScheduleDataSourceImpl();
});

final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref){
  final datasoure = ref.read(scheduleDataSourceProvider);
  return ScheduleRepositoryImpl(datasoure);
});

final fetchscheduleUsecaseProvider = Provider((ref) {
  final scheduleRepo = ref.read(scheduleRepositoryProvider);
  return ScheduleUsecase(scheduleRepo);
});