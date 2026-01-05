import 'package:do_dream_youth/presentation/ui/auth/login/log_in_view_model.dart';
import 'package:do_dream_youth/presentation/config/user_info/user_info_view_model.dart';
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

  bool isLoading = false;
  bool _isPasswordVisible = false;

  Future<void> emailSignUp(String email, String pwd) async {
    setState(() {
      isLoading = true;
    });
    try {
      await ref.read(logInViewModelProvider.notifier).logIn(email, pwd);
      ref.invalidate(userInfoViewModelProvider);

      emailController.clear();
      pwdController.clear();
    } catch (e) {
      if (mounted) setState(() => isLoading = false); // 로딩 종료
      // 로그인 실패 처리
      print('로그인 실패: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이메일 또는 비밀번호가 잘못되었습니다. 다시 시도해주세요.')),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Stack(
          children: [
            if (isLoading) Center(child: CircularProgressIndicator()),
            if (!isLoading)
              SafeArea(
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
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                  border: OutlineInputBorder(),
                                ),
                                autofillHints: const [AutofillHints.email],
                              ),
                              Text("Password"),
                              TextFormField(
                                controller: pwdController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: 'password',
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                autofillHints: const [AutofillHints.password],
                              ),
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
                            emailSignUp(emailController.text, pwdController.text);
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
          ],
        ),
      ),
    );
  }
}
