import 'package:do_dream_youth/domain/entity/attendance_st_entity.dart';

abstract interface class AttendanceStRepository {
    Future<void> createAttendance(AttendanceStEntity attendanceStEntity);

}