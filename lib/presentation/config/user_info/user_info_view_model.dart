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
    
    // 2. 로그인 상태라면, 비동기 작업을 수행하여 데이터를 가져옵니다.
    final data = await ref.read(userInfoUsecaseProvider).getUserInfo();
    
    // 3. 로드된 데이터를 반환합니다. 이 값이 state에 AsyncValue.data(data)로 저장됩니다.
    return data;
  }

  // Future<void> clearUserInfo() async {
  //   state = null;
  // }
}

final userInfoViewModelProvider = AsyncNotifierProvider<UserInfoViewModel, UserInfoEntity?>(
  () => UserInfoViewModel(),
);