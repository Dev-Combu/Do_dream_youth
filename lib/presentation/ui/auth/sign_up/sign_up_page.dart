import 'package:do_dream_youth/presentation/ui/auth/sign_up/sign_up_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key, required this.role});

  final String role;

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  Logger logger = Logger();

  Future<void> emailSignUp(String email, String pwd) async {
    try {
      await ref.read(signUpViewModelProvider.notifier).signUp(email, pwd);
      emailController.clear();
      pwdController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        logger.d('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        logger.d('The account already exists for that email.');
      }
    } catch (e) {
      logger.d(e);
      emailController.clear();
      pwdController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/login');
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          widget.role == 'teacher'
              ? '교사 회원가입'
              : (widget.role == 'student' ? '학생 회원가입' : '일반/방문객 회원가입'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email"),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Text("Password"),
                    TextField(controller: pwdController),
                  ],
                ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      emailSignUp(emailController.text, pwdController.text).then( (value) {
                        logger.i("회원가입 성공, email : ${emailController.text}, pwd : ${pwdController.text}");
                        context.go("/singupInfo", extra: {'role': widget.role});
                      }).catchError((e) {
                        logger.e("회원가입 실패, error : $e");
                      });
                    },
                    child: Text("회원가입"),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
