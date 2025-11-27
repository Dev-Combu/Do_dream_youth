import 'package:do_dream_youth/data/repository_impl/attendance_st_repository_impl.dart';
import 'package:do_dream_youth/data/source/attendance/student/attendance_st_data_source.dart';
import 'package:do_dream_youth/data/source/attendance/student/attendance_st_data_source_impl.dart';
import 'package:do_dream_youth/domain/repository/attendance_st_repository.dart';
import 'package:do_dream_youth/domain/usecase/attendance_st_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final atDataSourceProvider = Provider<AttendanceStDataSource>((ref) {
  return AttendanceStDataSourceImpl();
});

final atRepositoryProvider = Provider<AttendanceStRepository>((ref) {
  final data = ref.read(atDataSourceProvider);
  return AttendanceStRepositoryImpl(data);
});

final atUsecaseProvider = Provider((ref) {
  final authRepo = ref.read(atRepositoryProvider);
  return AttendanceStUsecase(authRepo);
});
