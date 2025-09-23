import 'package:do_dream_youth/domain/entity/user_info_entity.dart';

abstract interface class UserInfoRepository {
  Future<void> createUserInfo(UserInfoEntity userInfo);
}