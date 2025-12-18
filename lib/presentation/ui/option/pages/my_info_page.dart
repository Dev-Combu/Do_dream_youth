import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/presentation/ui/widgets/user_info/user_info_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go('/option');
          },
        ),
        centerTitle: true,
        title: Text('My Info'),
      ),
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
                        Text("부서", style: TextStyle(fontSize: 20)),
                        Text(
                          "${userinfo?.department ?? 'N/A'}부",
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
                child: 
                userinfo?.profile is TeacherProfileEntity
                ?
                Column(
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
                :Column(
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
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
