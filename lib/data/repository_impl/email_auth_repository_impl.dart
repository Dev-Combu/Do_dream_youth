import 'package:do_dream_youth/data/source/email_auth_data_source.dart';
import 'package:do_dream_youth/domain/entity/email_auth_entity.dart';
import 'package:do_dream_youth/domain/repository/email_auth_repository.dart';
import 'package:logger/logger.dart';

class EmailAuthRepositoryImpl implements EmailAuthRepository{
  EmailAuthRepositoryImpl(this._emailAuthDataSource);
  final EmailAuthDataSource _emailAuthDataSource;
  final Logger logger = Logger();


@override
Future<EmailAuthEntity> logIn(String email, String pwd) async {
  try {
    final result = await _emailAuthDataSource.logIn(email, pwd);

    // ⭐️ 널 체크: result가 null이면 예외를 던지거나 실패를 반환합니다. ⭐️
    if (result == null) {
      // 널 값은 로그인 실패(Invalid credentials, Network error 등)를 의미합니다.
      // 실제 상황에 맞는 적절한 예외(Exception)를 던지는 것이 좋습니다.
      throw Exception('로그인에 실패했습니다. (결과 데이터 없음)');
    }

    // result가 null이 아님을 확인한 후 안전하게 사용
    return EmailAuthEntity(
      email: result.email, // ! 없이 안전하게 접근
      uid: result.uid,
    );
  } catch (e) {
    // _emailAuthDataSource 내부에서 던져진 모든 예외를 여기서 처리합니다.
    // 예를 들어, 사용자에게 보여줄 에러 메시지를 포함하여 다시 던질 수 있습니다.
    throw Exception('로그인 처리 중 오류가 발생했습니다: $e');
  }
}

  @override
  Future<EmailAuthEntity> signUp(String email, String pwd) async{
    final result = await _emailAuthDataSource.signUp(email, pwd);
    return EmailAuthEntity(
      email: result!.email,
      uid: result.uid,
    );
  }
  
}

