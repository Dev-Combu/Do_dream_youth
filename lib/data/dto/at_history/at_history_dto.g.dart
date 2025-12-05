// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'at_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AtHistoryDto _$AtHistoryDtoFromJson(Map<String, dynamic> json) =>
    _AtHistoryDto(
      userId: json['userId'] as String,
      name: json['name'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      grade: json['grade'] as String,
    );

Map<String, dynamic> _$AtHistoryDtoToJson(_AtHistoryDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'timestamp': instance.timestamp.toIso8601String(),
      'grade': instance.grade,
    };
