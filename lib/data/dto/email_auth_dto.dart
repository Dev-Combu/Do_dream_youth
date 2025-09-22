import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_auth_dto.freezed.dart';
part 'email_auth_dto.g.dart';

@freezed
abstract class EmailAuthDto with _$EmailAuthDto{
  factory EmailAuthDto({
    required String email,
    required String uid,
  }) = _EmailAuthDto;

  factory EmailAuthDto.fromJson(Map<String, dynamic> json) => _$EmailAuthDtoFromJson(json);
}