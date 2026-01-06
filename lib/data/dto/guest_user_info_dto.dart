import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_user_info_dto.freezed.dart';
part 'guest_user_info_dto.g.dart';

@freezed
abstract class GuestUserInfoDto with _$GuestUserInfoDto {
  factory GuestUserInfoDto({
    required String role,
    required String name,
    required String christianName,
    required String phoneNumber,
  }) = _GuestUserInfoDto;

  factory GuestUserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$GuestUserInfoDtoFromJson(json);
}
