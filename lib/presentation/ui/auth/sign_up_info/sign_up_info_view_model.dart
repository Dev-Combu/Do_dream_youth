import 'package:do_dream_youth/domain/entity/email_auth_entity.dart';
import 'package:do_dream_youth/domain/entity/guest_info_entity.dart';
import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up_info/sign_up_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoViewModel extends Notifier<EmailAuthEntity?>{
  @override
  EmailAuthEntity? build() {
    return null;
  }

  Future<void> createUserInfo(UserInfoEntity userInfoEntity) async{
    return await ref.read(userInfoUsecaseProvider).createUserInfo(userInfoEntity);
  }

  Future<void> createGuestInfo(GuestInfoEntity guestInfoEntity) async{
    return await ref.read(userInfoUsecaseProvider).createGuestInfo(guestInfoEntity);
  }

}

final createUserInfoViewModelProvider = NotifierProvider<UserInfoViewModel, EmailAuthEntity?>(
  () => UserInfoViewModel(),
);