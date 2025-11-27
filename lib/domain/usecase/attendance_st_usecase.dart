import 'package:do_dream_youth/domain/entity/attendance_st_entity.dart';
import 'package:do_dream_youth/domain/repository/attendance_st_repository.dart';

class AttendanceStUsecase {
  final AttendanceStRepository _attendanceStRepository;
  AttendanceStUsecase(this._attendanceStRepository);

  Future<void> attendanceSt(AttendanceStEntity attendanceStEntity){
    return _attendanceStRepository.createAttendance(attendanceStEntity);
  }
}