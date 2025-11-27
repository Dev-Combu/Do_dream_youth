import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_teacher_dto.freezed.dart';
part 'attendance_teacher_dto.g.dart';

@freezed
abstract class AttendanceTeacherDto with _$AttendanceTeacherDto{
  factory AttendanceTeacherDto({
    required String token,
    required DateTime createdAt,
    
  }) = _AttendanceTeacherDto;

  factory AttendanceTeacherDto.fromJson(Map<String, dynamic> json) => _$AttendanceTeacherDtoFromJson(json);
}
