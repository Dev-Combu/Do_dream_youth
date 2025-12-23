import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_dto.freezed.dart';
part 'schedule_dto.g.dart';

DateTime _toDateTimeNonNull(dynamic v) {
  if (v is Timestamp) return v.toDate();
  if (v is String) return DateTime.parse(v);
  if (v is DateTime) return v;
  throw ArgumentError('Invalid date format: $v');
}

// DateTime? → Firestore Timestamp?
Object? _fromDateTimeNullable(DateTime? v) {
  if (v == null) return null;
  return Timestamp.fromDate(v);
}

@freezed
abstract class ScheduleDto with _$ScheduleDto{
  factory ScheduleDto({
    @JsonKey(includeToJson: false)
    String? id,
    required String name,
    @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable)
    required DateTime startDate,
    @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable)
    required DateTime endDate,
    required String target,
    required String description,
  }) = _ScheduleDto;

  factory ScheduleDto.fromJson(Map<String, dynamic> json) => _$ScheduleDtoFromJson(json);
}