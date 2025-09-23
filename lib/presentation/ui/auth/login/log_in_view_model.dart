import 'package:do_dream_youth/domain/entity/email_auth_entity.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up/sign_up_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class 
LogInViewModel extends Notifier<EmailAuthEntity?>{
  @override
  EmailAuthEntity? build() {
    return null;
  }
  
  Future<void> logIn(String email, String pwd) async{
    await ref.read(fetchAuthUsecaseProvider).logIn(email, pwd);
  }
}

final logInViewModelProvider = NotifierProvider<LogInViewModel, EmailAuthEntity?>(
  () => LogInViewModel(),
);