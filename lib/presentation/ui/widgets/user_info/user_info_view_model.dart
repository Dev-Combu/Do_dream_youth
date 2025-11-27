import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/presentation/ui/widgets/user_info/user_info_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoViewModel extends AsyncNotifier<UserInfoEntity?> {
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserInfoEntity?> build() async {
    // 1. 초기 로딩 시점: FirebaseAuth 상태를 확인합니다.
    final user = _auth.currentUser;
    
    // 만약 로그아웃 상태라면 즉시 null 반환 (데이터 없음)
    if (user == null) {
      return null;
    }
    
    // 2. 로그인 상태라면, 비동기 작업을 수행하여 데이터를 가져옵니다.
    // fetchUserInfo 로직을 build 내부로 옮깁니다.
    // build() 메서드가 호출되면 자동으로 데이터 로드를 시작합니다.
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