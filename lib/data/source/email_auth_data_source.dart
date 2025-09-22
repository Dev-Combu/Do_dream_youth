import 'package:do_dream_youth/data/dto/email_auth_dto.dart';

abstract interface class EmailAuthDataSource {
  Future <EmailAuthDto?> logIn(String email, String pwd);
  Future <EmailAuthDto?> signUp(String email, String pwd);
}