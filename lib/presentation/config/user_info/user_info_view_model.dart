import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/presentation/config/user_info/user_info_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoViewModel extends AsyncNotifier<UserInfoEntity?> {
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserInfoEntity?> build() async {
    final user = _auth.currentUser;
    if (user == null) {
      return null;
    }
    
    final data = await ref.read(userInfoUsecaseProvider).getUserInfo();
    
    return data;
  }

  // Future<void> clearUserInfo() async {
  //   state = null;
  // }
}

final userInfoViewModelProvider = AsyncNotifierProvider<UserInfoViewModel, UserInfoEntity?>(
  () => UserInfoViewModel(),
);