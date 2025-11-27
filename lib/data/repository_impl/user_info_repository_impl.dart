import 'package:do_dream_youth/data/dto/user_info_dto.dart';
import 'package:do_dream_youth/data/source/user_info_data_source.dart';
import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/domain/repository/user_info_repository.dart';
import 'package:logger/logger.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  UserInfoRepositoryImpl(this._userInfoDataSource);
  final UserInfoDataSource _userInfoDataSource;
  final Logger log = Logger();

  @override
  Future<void> createUserInfo(UserInfoEntity userInfo) {
    Map<String, dynamic> profileDto;
    final p = userInfo.profile;

    if (p is StudentProfileEntity) {
      profileDto = ProfileDto.student(
        school: p.school,
        grade: p.grade,
        guardian: p.guardian,
        guardianPhoneNumber: p.guardianPhoneNumber,
      ).toJson();
    } else if (p is TeacherProfileEntity) {
      profileDto = ProfileDto.teacher(
        grade: p.grade,
        careerYears: p.careerYears,
      ).toJson();
    } else {
      profileDto = {};
    }

    final userInfoDto = UserInfoDto(
      role: userInfo.role,
      name: userInfo.name,
      christianName: userInfo.christianName,
      phoneNumber: userInfo.phoneNumber,
      department: userInfo.department,
      profile: profileDto,
    );
    return _userInfoDataSource.createUserInfo(userInfoDto);
  }

  @override
  Stream<UserInfoEntity?> getUserInfoStream() {
    return _userInfoDataSource.getUserInfoStream().map((userInfoDto) {
      if (userInfoDto == null) {
        return null;
      }

      Profile profileEntity;
      final p = userInfoDto.profile;

      if (userInfoDto.role == 'student') {
        profileEntity = StudentProfileEntity(
          school: p['school'] ?? '',
          grade: p['grade'] ?? '',
          guardian: p['guardian'] ?? '',
          guardianPhoneNumber: p['guardianPhoneNumber'] ?? '',
        );
      } else{
        profileEntity = TeacherProfileEntity(
          grade: p['grade'] ?? '',
          careerYears: p['careerYears'] ?? 0,
        );
      }

      return UserInfoEntity(
        role: userInfoDto.role,
        name: userInfoDto.name,
        christianName: userInfoDto.christianName,
        phoneNumber: userInfoDto.phoneNumber,
        department: userInfoDto.department,
        profile: profileEntity,
      );
    });
  }

  @override
  Future<UserInfoEntity> getUserInfo() async {
    final userInfoDto =  await _userInfoDataSource.getUserInfo();

    Profile profileEntity;
    final p = userInfoDto.profile;

    if (userInfoDto.role == 'student') {
      profileEntity = StudentProfileEntity(
        school: p['school'] ?? '',
        grade: p['grade'] ?? '',
        guardian: p['guardian'] ?? '',
        guardianPhoneNumber: p['guardianPhoneNumber'] ?? '',
      );
    } else{
      profileEntity = TeacherProfileEntity(
        grade: p['grade'] ?? '',
        careerYears: p['careerYears'] ?? 0,
      );
    }

    return UserInfoEntity(
      role: userInfoDto.role,
      name: userInfoDto.name,
      christianName: userInfoDto.christianName,
      phoneNumber: userInfoDto.phoneNumber,
      department: userInfoDto.department,
      profile: profileEntity,
    );
  }
}
