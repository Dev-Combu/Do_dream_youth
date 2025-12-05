import 'package:do_dream_youth/presentation/ui/auth/login/log_in_view_model.dart';
import 'package:do_dream_youth/presentation/ui/widgets/user_info/user_info_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  Future<void> emailSignUp(String email, String pwd) async {
    await ref.read(logInViewModelProvider.notifier).logIn(email, pwd);
    emailController.clear();
    pwdController.clear();
  }

  Future<void> loadUserInfo() async {
    ref.watch(userInfoViewModelProvider).value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("로그인"),
                SizedBox(
                  child: Column(
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
                ),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        //회원가입 페이지로 이동

                        context.go("/signuprole");
                        print("회원가입 페이지로 이동");
                      },
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("회원가입"),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    emailSignUp(
                      emailController.text,
                      pwdController.text,
                    ).then((_) => loadUserInfo());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("로그인"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
