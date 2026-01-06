import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_dto.freezed.dart';
part 'user_info_dto.g.dart';

@Freezed(toJson: true, fromJson: true)
abstract class UserInfoDto with _$UserInfoDto {
  const factory UserInfoDto({
  required String role,
  required String name,
  required String christianName,
  required String phoneNumber,
  String? department,
  Map<String, dynamic>? profile,
}) = _UserInfoDto;
factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);

}

// 추상 ProfileDto (union/sealed class 형태)
@Freezed(unionKey: 'type', toJson: true, fromJson: true)
abstract class ProfileDto with _$ProfileDto {
  const factory ProfileDto.student({
    required String school,
    required String grade,
    required String guardian,
    required String guardianPhoneNumber,
  }) = StudentProfileDto;

  const factory ProfileDto.teacher({
    required String grade,
    required int careerYears,
  }) = TeacherProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
}