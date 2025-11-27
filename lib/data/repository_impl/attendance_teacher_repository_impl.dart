import 'package:do_dream_youth/data/source/attendance/teacher/attendance_teacher_data_source.dart';
import 'package:do_dream_youth/domain/entity/attendance_teacher_entity.dart';
import 'package:do_dream_youth/domain/repository/attendance_teacher_repository.dart';

class AttendanceTeacherRepositoryimpl implements AttendanceTeacherRepository{
  AttendanceTeacherRepositoryimpl(this._attendanceTeacherDataSource);
  final AttendanceTeacherDataSource _attendanceTeacherDataSource;

  @override
  Future<AttendanceTeacherEntity> getsetAttendanceToken() async{
    final result = await _attendanceTeacherDataSource.getsetAttendanceToken();
      return AttendanceTeacherEntity(token: result.token, createdAt: result.createdAt);
  }
}