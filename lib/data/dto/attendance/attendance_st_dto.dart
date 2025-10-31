
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_st_dto.freezed.dart';
part 'attendance_st_dto.g.dart';

@freezed
abstract class AttendanceStDto with _$AttendanceStDto{
  factory AttendanceStDto({
    required String userId,
    required String name,
    required DateTime timestamp,
    
  }) = _AttendanceStDto;

  factory AttendanceStDto.fromJson(Map<String, dynamic> json) => _$AttendanceStDtoFromJson(json);
}
