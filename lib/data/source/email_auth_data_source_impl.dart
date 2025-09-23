import 'package:do_dream_youth/data/dto/email_auth_dto.dart';
import 'package:do_dream_youth/data/source/email_auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class EmailAuthDataSourceImpl implements EmailAuthDataSource{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Logger logger = Logger();

  @override
  Future<EmailAuthDto?> logIn(String email, String pwd) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pwd);
      if (userCredential.user != null) {
        logger.i("로그인 성공 id : $email, pwd : $pwd, uid : ${userCredential.user?.uid}");
        return EmailAuthDto(
          email: userCredential.user?.email ?? '',
          uid: userCredential.user?.uid ?? '',
        );
      }
    } on FirebaseAuthException catch (e) {
      // Firebase에서 발생하는 특정 에러 코드를 캐치하여 사용자 친화적인 메시지로 변환합니다.
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = '해당 이메일로 등록된 사용자가 없습니다.';
          break;
        case 'wrong-password':
          errorMessage = '비밀번호가 올바르지 않습니다.';
          break;
        case 'invalid-email':
          errorMessage = '유효하지 않은 이메일 형식입니다.';
          break;
        case 'user-disabled':
          errorMessage = '사용이 중지된 계정입니다.';
          break;
        case 'too-many-requests':
          errorMessage = '너무 많은 로그인 시도입니다. 잠시 후 다시 시도해주세요.';
          break;
        case 'network-request-failed': // 네트워크 오류 추가
          errorMessage = '네트워크 연결 상태를 확인해주세요.';
          break;
        default:
          errorMessage = '알 수 없는 인증 오류가 발생했습니다. (${e.message ?? e.code})';
          break;
      }
      // ServerException을 던져서 상위 레이어에서 이를 처리하도록 합니다.
      print("오류가 발생했습니다 : $errorMessage");
    } catch (e) {
      print('예상치 못한 오류가 발생했습니다: ${e.toString()}');
    }
    return null;
  }

  @override
  Future<EmailAuthDto> signUp(String email, String pwd) {
    try{
      return _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pwd)
          .then((UserCredential userCredential) {
        logger.i("회원가입 성공 id : $email, pwd : $pwd, uid : ${userCredential.user?.uid}");
        return EmailAuthDto(
          email: userCredential.user?.email ?? '',
          uid: userCredential.user?.uid ?? '',
        );
      });
    }
    on FirebaseAuthException catch (e) {
      // Firebase에서 발생하는 특정 에러 코드를 캐치하여 사용자 친화적인 메시지로 변환합니다.
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = '이미 사용 중인 이메일입니다.';
          break;
        case 'invalid-email':
          errorMessage = '유효하지 않은 이메일 형식입니다.';
          break;
        case 'operation-not-allowed':
          errorMessage = '이메일/비밀번호 로그인이 비활성화되어 있습니다.';
          break;
        case 'weak-password':
          errorMessage = '비밀번호가 너무 약합니다. 더 강력한 비밀번호를 사용해주세요.';
          break;
        case 'network-request-failed': // 네트워크 오류 추가
          errorMessage = '네트워크 연결 상태를 확인해주세요.';
          break;
        default:
          errorMessage = '알 수 없는 인증 오류가 발생했습니다. (${e.message ?? e.code})';
          break;
      }
      // ServerException을 던져서 상위 레이어에서 이를 처리하도록 합니다.
      print("오류가 발생했습니다 : $errorMessage");
      rethrow; // 예외를 다시 던져서 상위 레이어에서 처리할 수 있도록 합니다.
    } catch (e) {
      print('예상치 못한 오류가 발생했습니다: ${e.toString()}');
      rethrow; // 예외를 다시 던져서 상위 레이어에서 처리할 수 있도록 합니다.
    }
  }
  
}