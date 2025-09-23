import 'package:do_dream_youth/domain/entity/email_auth_entity.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up/sign_up_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class SignUpViewModel extends Notifier<EmailAuthEntity?>{
  @override
  EmailAuthEntity? build() {
    return null;
  }
  
  Future<void> signUp(String email, String pwd) async{
    await ref.read(fetchAuthUsecaseProvider).signUp(email, pwd);
  }
}

final signUpViewModelProvider = NotifierProvider<SignUpViewModel, EmailAuthEntity?>(
  () => SignUpViewModel(),
);