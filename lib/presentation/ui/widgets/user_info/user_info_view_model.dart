import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/presentation/ui/widgets/user_info/user_info_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoViewModel extends Notifier<UserInfoEntity?> {
  final _auth = FirebaseAuth.instance;

  @override
  UserInfoEntity? build() {
    return null;
  }

  // Stream<void> getUserInfo(UserInfoEntity userInfoEntity) {
  //   return ref.read(userInfoUsecaseProvider).getUserInfoStream();
  // }

    Future<void> fetchUserInfo() async {
    final data = await ref.read(userInfoUsecaseProvider).getUserInfo();
    state = data;
  }

  // Future<void> clearUserInfo() async {
  //   state = null;
  // }
}

final userInfoViewModelProvider = NotifierProvider<UserInfoViewModel, UserInfoEntity?>(
  () => UserInfoViewModel(),
);