import 'package:do_dream_youth/domain/entity/attendance_teacher_entity.dart';

abstract class AttendanceTeacherRepository{
  Future<AttendanceTeacherEntity> getsetAttendanceToken();
}