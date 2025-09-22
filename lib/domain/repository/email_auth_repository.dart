import 'package:do_dream_youth/domain/entity/email_auth_entity.dart';

abstract interface class EmailAuthRepository {
  Future <EmailAuthEntity> logIn(String email, String pwd);
  Future <EmailAuthEntity> signUp(String email, String pwd);
}