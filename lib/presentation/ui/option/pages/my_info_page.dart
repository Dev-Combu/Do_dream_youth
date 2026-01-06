import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/presentation/config/user_info/user_info_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class MyInfoPage extends ConsumerStatefulWidget {
  const MyInfoPage({super.key});

  @override
  ConsumerState<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends ConsumerState<MyInfoPage> {
  final user = FirebaseAuth.instance.currentUser;
  Logger log = Logger();

  @override
  void initState() {
    super.initState();
  }

  String? profileGrade;
  int? careerYears;

  String? pGuardian;
  String? pGuardianPhoneNumber;

  String? school;

  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // 탈퇴 로직 함수
  Future<void> _withdraw(String password) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String? email = user?.email;

      if (email != null) {
        // 1. 재인증 자격 증명 생성
        AuthCredential credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );

        // 2. 재인증 후 계정 삭제
        await user?.reauthenticateWithCredential(credential);
        await user?.delete();

        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("회원 탈퇴가 완료되었습니다.")));
          // 로그인 화면 등으로 이동
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil('/login', (route) => false);
        }
      }
    } on FirebaseAuthException catch (e) {
      String message = "에러가 발생했습니다.";
      if (e.code == 'wrong-password') message = "비밀번호가 틀립니다.";

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  // 탈퇴 확인 다이얼로그 호출
  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "회원 탈퇴",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("보안을 위해 비밀번호를 입력해주세요. 모든 데이터가 삭제되며 복구할 수 없습니다."),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "비밀번호",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? "비밀번호를 입력하세요" : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("취소"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _withdraw(_passwordController.text);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("탈퇴하기", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userinfo = ref.watch(userInfoViewModelProvider).value;
    log.e("UUID : ${user?.uid}");

    if (userinfo?.profile is TeacherProfileEntity) {
      TeacherProfileEntity teacherProfile =
          userinfo?.profile as TeacherProfileEntity;
      profileGrade = teacherProfile.grade;
      careerYears = teacherProfile.careerYears;
    } else if (userinfo?.profile is StudentProfileEntity) {
      StudentProfileEntity studentProfile =
          userinfo?.profile as StudentProfileEntity;
      profileGrade = studentProfile.grade;
      pGuardian = studentProfile.guardian;
      pGuardianPhoneNumber = studentProfile.guardianPhoneNumber;
      school = studentProfile.school;
    }

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('My Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('로그인 정보'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("이메일", style: TextStyle(fontSize: 20)),
                        Text(
                          user?.email ?? 'N/A',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 32),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('개인 정보'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("이름", style: TextStyle(fontSize: 20)),
                        Text(
                          userinfo?.name ?? 'N/A',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("세례명", style: TextStyle(fontSize: 20)),
                        Text(
                          userinfo?.christianName ?? 'N/A',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("전화번호", style: TextStyle(fontSize: 20)),
                        Text(
                          userinfo?.phoneNumber ?? 'N/A',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    if (userinfo?.role != "guest") ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("부서", style: TextStyle(fontSize: 20)),
                          Text(
                            "${userinfo?.department ?? 'N/A'}부",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Divider(height: 32),
            if (userinfo?.role != 'guest') ...[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: userinfo?.profile is TeacherProfileEntity
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("담당 학년", style: TextStyle(fontSize: 20)),
                                Text(
                                  profileGrade ?? 'N/A',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("역할", style: TextStyle(fontSize: 20)),
                                Text(
                                  "$careerYears년차",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("학년", style: TextStyle(fontSize: 20)),
                                Text(
                                  profileGrade ?? 'N/A',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              _showDeleteDialog();
            },
            child: Text('회원탈퇴'),
          ),
        ),
      ),
    );
  }
}
