import 'package:do_dream_youth/presentation/ui/auth/login/log_in_view_model.dart';
import 'package:do_dream_youth/presentation/config/user_info/user_info_view_model.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                autofillHints: const [AutofillHints.password],
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            emailSignUp(
                              emailController.text,
                              pwdController.text,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              16.0,
                              0,
                              16.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue[300],
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("로그인", textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    passwordModal(context);
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("비밀번호 찾기"),
                                    ),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    //회원가입 페이지로 이동
                                    context.go("/signuprole");
                                    print("회원가입 페이지로 이동");
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("회원가입"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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

  Future<dynamic> passwordModal(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("비밀번호 찾기"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("가입하신 이메일 주소를 입력해주세요. 비밀번호 재설정 링크를 보내드립니다."),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "이메일",
                  border: OutlineInputBorder(),
                  hintText: "example@email.com",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("취소"),
            ),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text.trim();
                if (email.isEmpty) {
                  // 이메일 미입력 시 처리
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("이메일을 입력해주세요.")));
                  return;
                }

                try {
                  await _auth.sendPasswordResetEmail(email: email);
                  Navigator.pop(context); // 모달 닫기

                  // 성공 알림
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("비밀번호 재설정 이메일이 발송되었습니다.")),
                  );
                } on FirebaseAuthException catch (e) {
                  // 에러 발생 시 알림 (예: 등록되지 않은 이메일 등)
                  String message = "오류가 발생했습니다.";
                  if (e.code == 'user-not-found') {
                    message = "등록되지 않은 사용자입니다.";
                  } else if (e.code == 'invalid-email') {
                    message = "유효하지 않은 이메일 형식입니다.";
                  }

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message)));
                }
              },
              child: const Text("전송"),
            ),
          ],
        );
      },
    );
  }
}
