import 'package:do_dream_youth/data/repository_impl/attendance_teacher_repository_impl.dart';
import 'package:do_dream_youth/data/source/attendance/teacher/attendance_teacher_data_source.dart';
import 'package:do_dream_youth/data/source/attendance/teacher/attendance_teacher_data_source_impl.dart';
import 'package:do_dream_youth/domain/repository/attendance_teacher_repository.dart';
import 'package:do_dream_youth/domain/usecase/attendance_teacher_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final qrDataSourceProvider = Provider<AttendanceTeacherDataSource>((ref) {
  return AttendanceTeacherDataSourceImpl();
});

final qrRepositoryProvider = Provider<AttendanceTeacherRepository>((ref) {
  final data = ref.read(qrDataSourceProvider);
  return AttendanceTeacherRepositoryimpl(data);
});

final qrUsecaseProvider = Provider((ref) {
  final authRepo = ref.read(qrRepositoryProvider);
  return AttendanceTeacherUsecase(authRepo);
});