
import 'package:freezed_annotation/freezed_annotation.dart'; 

part 'at_history_dto.freezed.dart';
part 'at_history_dto.g.dart';

@freezed
abstract class AtHistoryDto with _$AtHistoryDto{
  factory AtHistoryDto({
    required String userId,
    required String name,
    required DateTime timestamp,
    required String grade
    
  }) = _AtHistoryDto;

  factory AtHistoryDto.fromJson(Map<String, dynamic> json) => _$AtHistoryDtoFromJson(json);
}
