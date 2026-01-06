import 'package:do_dream_youth/data/dto/guest_user_info_dto.dart';
import 'package:do_dream_youth/data/dto/user_info_dto.dart';

abstract interface class UserInfoDataSource {
  Future<void> createUserInfo(UserInfoDto userInfo);
  Future<void> createGuestInfo(GuestUserInfoDto guestInfo);
  

  Stream<UserInfoDto?> getUserInfoStream();
  Future<UserInfoDto> getUserInfo();
  
}