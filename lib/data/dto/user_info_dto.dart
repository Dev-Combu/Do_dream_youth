import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_dto.freezed.dart';
part 'user_info_dto.g.dart';

@freezed
abstract class UserInfoDto with _$UserInfoDto {
  factory UserInfoDto({
  required String uid,
  required String role,
  required String name,
  required String christianName,
  required String phoneNumber,
  required String department,
  ProfileDto? profile,
}) = _UserInfoDto;
factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);

}

// 추상 ProfileDto (union/sealed class 형태)
@Freezed(unionKey: 'type') // JSON 직렬화 시 어떤 타입인지 구분
abstract class ProfileDto with _$ProfileDto {
  const factory ProfileDto.student({
    required String shcool,
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