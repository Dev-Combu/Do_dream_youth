import 'package:do_dream_youth/data/dto/user_info_dto.dart';

abstract interface class UserInfoDataSource {
  Future<void> createUserInfo(UserInfoDto userInfo);

  Stream<UserInfoDto?> getUserInfoStream();
  Future<UserInfoDto> getUserInfo();
  
}