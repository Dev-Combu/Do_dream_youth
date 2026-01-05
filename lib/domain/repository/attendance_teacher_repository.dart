import 'package:do_dream_youth/domain/entity/attendance_teacher_entity.dart';

abstract interface class AttendanceTeacherRepository{
  Future<AttendanceTeacherEntity> getsetAttendanceToken();
}