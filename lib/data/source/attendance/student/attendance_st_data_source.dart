import 'package:do_dream_youth/data/dto/attendance_student/attendance_st_dto.dart';
import 'package:do_dream_youth/domain/entity/attendance_st_entity.dart';

abstract interface class AttendanceStDataSource {
  Future<void> createAttendance(AttendanceStDto attendanceStDto);
}