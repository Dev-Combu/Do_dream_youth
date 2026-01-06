// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) => _UserInfoDto(
  role: json['role'] as String,
  name: json['name'] as String,
  christianName: json['christianName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  department: json['department'] as String?,
  profile: json['profile'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UserInfoDtoToJson(_UserInfoDto instance) =>
    <String, dynamic>{
      'role': instance.role,
      'name': instance.name,
      'christianName': instance.christianName,
      'phoneNumber': instance.phoneNumber,
      'department': instance.department,
      'profile': instance.profile,
    };

StudentProfileDto _$StudentProfileDtoFromJson(Map<String, dynamic> json) =>
    StudentProfileDto(
      school: json['school'] as String,
      grade: json['grade'] as String,
      guardian: json['guardian'] as String,
      guardianPhoneNumber: json['guardianPhoneNumber'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$StudentProfileDtoToJson(StudentProfileDto instance) =>
    <String, dynamic>{
      'school': instance.school,
      'grade': instance.grade,
      'guardian': instance.guardian,
      'guardianPhoneNumber': instance.guardianPhoneNumber,
      'type': instance.$type,
    };

TeacherProfileDto _$TeacherProfileDtoFromJson(Map<String, dynamic> json) =>
    TeacherProfileDto(
      grade: json['grade'] as String,
      careerYears: (json['careerYears'] as num).toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$TeacherProfileDtoToJson(TeacherProfileDto instance) =>
    <String, dynamic>{
      'grade': instance.grade,
      'careerYears': instance.careerYears,
      'type': instance.$type,
    };
