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
    final result = await _emailAuthDataSource.logIn(email, pwd);
    return EmailAuthEntity(
      email: result!.email,
      uid: result.uid,
    );
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

