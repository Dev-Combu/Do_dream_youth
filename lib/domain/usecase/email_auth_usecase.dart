
import 'package:do_dream_youth/domain/entity/email_auth_entity.dart';
import 'package:do_dream_youth/domain/repository/email_auth_repository.dart';

class EmailAuthUsecase {
  EmailAuthUsecase(this._emailAuthRepository);
  final EmailAuthRepository _emailAuthRepository;

  Future<EmailAuthEntity?> logIn(String email, String pwd) async{
    return await _emailAuthRepository.logIn(email, pwd);
  }

  Future<EmailAuthEntity?> signUp(String email, String pwd) async{
    return await _emailAuthRepository.signUp(email, pwd);
  }
}