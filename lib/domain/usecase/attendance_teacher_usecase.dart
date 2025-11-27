import 'package:do_dream_youth/domain/entity/attendance_teacher_entity.dart';
import 'package:do_dream_youth/domain/repository/attendance_teacher_repository.dart';

class AttendanceTeacherUsecase {
  final AttendanceTeacherRepository _attendanceTeacherRepository;

  AttendanceTeacherUsecase(this._attendanceTeacherRepository);

  Future<AttendanceTeacherEntity> getsetAttendanceToken() {
    return _attendanceTeacherRepository.getsetAttendanceToken();
  }
}