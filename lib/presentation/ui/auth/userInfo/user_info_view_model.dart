import 'package:do_dream_youth/domain/entity/email_auth_entity.dart';
import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/presentation/ui/auth/userInfo/user_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoViewModel extends Notifier<EmailAuthEntity?>{
  @override
  EmailAuthEntity? build() {
    return null;
  }

  Future<void> createUserInfo(String uid, UserInfoEntity userInfoEntity) async{
    return await ref.read(userInfoUsecaseProvider).createUserInfo(userInfoEntity);
  }

}

final userInfoViewModelProvider = NotifierProvider<UserInfoViewModel, EmailAuthEntity?>(
  () => UserInfoViewModel(),
);