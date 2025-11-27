import 'package:do_dream_youth/data/dto/attendance_teacher/attendance_teacher_dto.dart';

abstract interface class AttendanceTeacherDataSource {
  Future<AttendanceTeacherDto> getsetAttendanceToken();
}
