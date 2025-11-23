import 'package:do_dream_youth/data/dto/attendance_student/attendance_st_dto.dart';

abstract interface class AttendanceStDataSource {
  Future<AttendanceStDto> createAttendance();
}