// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_teacher_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceTeacherDto _$AttendanceTeacherDtoFromJson(
  Map<String, dynamic> json,
) => _AttendanceTeacherDto(
  token: json['token'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AttendanceTeacherDtoToJson(
  _AttendanceTeacherDto instance,
) => <String, dynamic>{
  'token': instance.token,
  'createdAt': instance.createdAt.toIso8601String(),
};
