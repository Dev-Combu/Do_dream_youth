import 'package:do_dream_youth/data/dto/attendance_student/attendance_st_dto.dart';
import 'package:do_dream_youth/data/source/attendance/student/attendance_st_data_source.dart';
import 'package:do_dream_youth/domain/entity/attendance_st_entity.dart';
import 'package:do_dream_youth/domain/repository/attendance_st_repository.dart';

class AttendanceStRepositoryImpl implements AttendanceStRepository {
  AttendanceStRepositoryImpl(this._attendanceStDataSource);
  final AttendanceStDataSource _attendanceStDataSource;

  @override
  Future<void> createAttendance(AttendanceStEntity attendanceStEntity) async {
    // 1. Entity를 DTO로 변환
    final attendanceStDto = AttendanceStDto(
      name: attendanceStEntity.name,
      userId: attendanceStEntity.userId,
      timestamp: attendanceStEntity.timestamp,
    );

    // 2. 변환된 DTO를 Data Source에 전달
    return await _attendanceStDataSource.createAttendance(attendanceStDto);
  }
}
