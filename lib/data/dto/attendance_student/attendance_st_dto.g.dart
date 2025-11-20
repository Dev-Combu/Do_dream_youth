// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_st_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceStDto _$AttendanceStDtoFromJson(Map<String, dynamic> json) =>
    _AttendanceStDto(
      userId: json['userId'] as String,
      name: json['name'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$AttendanceStDtoToJson(_AttendanceStDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'timestamp': instance.timestamp.toIso8601String(),
    };
