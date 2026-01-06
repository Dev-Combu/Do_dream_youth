import 'package:do_dream_youth/domain/entity/guest_info_entity.dart';
import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/domain/repository/user_info_repository.dart';

class UserInfoUsecase {
  UserInfoUsecase(this._userInfoRepository);
  final UserInfoRepository _userInfoRepository;

  Future<void> createUserInfo(UserInfoEntity userInfo) async {
    return await _userInfoRepository.createUserInfo(userInfo);
  }

  Future<void> createGuestInfo(GuestInfoEntity guestInfo) async {
    return await _userInfoRepository.createGuestInfo(guestInfo);
  }


  Stream<UserInfoEntity?> getUserInfoStream() {
    return _userInfoRepository.getUserInfoStream();
  }

  Future<UserInfoEntity> getUserInfo() async {
    return await _userInfoRepository.getUserInfo();
  }
}