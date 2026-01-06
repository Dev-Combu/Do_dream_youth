import 'package:do_dream_youth/domain/entity/guest_info_entity.dart';
import 'package:do_dream_youth/domain/entity/user_info_entity.dart';

abstract interface class UserInfoRepository {
  Future<void> createUserInfo(UserInfoEntity userInfo);
  Future<void> createGuestInfo(GuestInfoEntity guestInfo);
  Stream<UserInfoEntity?> getUserInfoStream();
  Future<UserInfoEntity> getUserInfo();
}