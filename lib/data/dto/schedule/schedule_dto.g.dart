// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleDto _$ScheduleDtoFromJson(Map<String, dynamic> json) => _ScheduleDto(
  name: json['name'] as String,
  startDate: _toDateTimeNonNull(json['startDate']),
  endDate: _toDateTimeNonNull(json['endDate']),
  target: json['target'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$ScheduleDtoToJson(_ScheduleDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'startDate': _fromDateTimeNullable(instance.startDate),
      'endDate': _fromDateTimeNullable(instance.endDate),
      'target': instance.target,
      'description': instance.description,
    };
