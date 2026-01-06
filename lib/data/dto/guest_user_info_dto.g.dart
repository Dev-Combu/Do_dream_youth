// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GuestUserInfoDto _$GuestUserInfoDtoFromJson(Map<String, dynamic> json) =>
    _GuestUserInfoDto(
      role: json['role'] as String,
      name: json['name'] as String,
      christianName: json['christianName'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$GuestUserInfoDtoToJson(_GuestUserInfoDto instance) =>
    <String, dynamic>{
      'role': instance.role,
      'name': instance.name,
      'christianName': instance.christianName,
      'phoneNumber': instance.phoneNumber,
    };
