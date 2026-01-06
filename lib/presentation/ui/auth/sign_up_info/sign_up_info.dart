import 'package:do_dream_youth/domain/entity/guest_info_entity.dart';
import 'package:do_dream_youth/domain/entity/user_info_entity.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up_info/sign_up_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class SignUpInfo extends ConsumerStatefulWidget {
  const SignUpInfo({super.key, required this.role});
  final String role;

  @override
  ConsumerState<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends ConsumerState<SignUpInfo> {
  Logger log = Logger();

  TextEditingController nameController = TextEditingController();
  TextEditingController csnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController gdphoneController = TextEditingController();
  TextEditingController careerYearsController = TextEditingController();

  static List<String> grade = <String>[
    '중학교 1학년',
    '중학교 2학년',
    '중학교 3학년',
    '고등학교 1학년',
    '고등학교 2학년',
    '고등학교 3학년',
  ];
  String gradeValue = grade.first;

  static List<String> department = <String>['전례', '성가', '둘다', '없음'];
  String departmentValue = department.first;

  static List<String> guardian = <String>['부', '모', '기타'];
  String guardianValue = guardian.first;

  Future<void> createUserInfo(UserInfoEntity userInfoEntity) async {
    try {
      await ref
          .read(createUserInfoViewModelProvider.notifier)
          .createUserInfo(userInfoEntity);
      log.i("회원정보 생성 완료");
    } catch (e) {
      log.i("회원정보 생성 실패 : $e");
    }
  }

    Future<void> createGuestInfo(GuestInfoEntity guestInfoEntity) async {
    try {
      await ref
          .read(createUserInfoViewModelProvider.notifier)
          .createGuestInfo(guestInfoEntity);
      log.i("회원정보 생성 완료");
    } catch (e) {
      log.i("회원정보 생성 실패 : $e");
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
        title: Text('회원 정보'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                widget.role == 'guest'
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("이름"),
                    TextField(controller: nameController),
                    Text("세례명"),
                    TextField(controller: csnameController),
                    Text("전화번호"),
                    TextField(controller: phoneController),
                  ]
                )
                : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("이름"),
                          TextField(controller: nameController),
                          Text("세례명"),
                          TextField(controller: csnameController),
                          Text("전화번호"),
                          TextField(controller: phoneController),
                          if (widget.role == 'teacher') ...[
                            Text("경력(년)"),
                            TextField(controller: careerYearsController),
                            Text("담당 학년"),
                            DropdownButton<String>(
                              value: gradeValue,
                              items: grade
                                  .map(
                                    (e) => DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? v) {
                                setState(() => gradeValue = v!);
                              },
                            ),
                          ] else ...[
                            Text("학교"),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: schoolController,
                                  ),
                                ),
                                SizedBox(width: 12),
                                DropdownButton<String>(
                                  value: gradeValue,
                                  items: grade
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (String? v) {
                                    setState(() => gradeValue = v!);
                                  },
                                ),
                              ],
                            ),
                            Text("보호자 정보"),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: guardianValue,
                                  items: guardian
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (String? v) {
                                    setState(() => guardianValue = v!);
                                  },
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    controller: gdphoneController,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          Text("담당 부서"),
                          DropdownButton<String>(
                            value: departmentValue,
                            items: department
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? v) {
                              setState(() => departmentValue = v!);
                            },
                          ),
                        ],
                      ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    widget.role == 'guest'
                        ? createGuestInfo(
                            GuestInfoEntity(
                              role: widget.role,
                              name: nameController.text,
                              christianName: csnameController.text,
                              phoneNumber: phoneController.text,
                            ),
                          ).then((value) => context.go('/schedule'))
                        : createUserInfo(
                            UserInfoEntity(
                              role: widget.role,
                              name: nameController.text,
                              christianName: csnameController.text,
                              phoneNumber: phoneController.text,
                              department: departmentValue,
                              profile: widget.role == 'teacher'
                                  ? TeacherProfileEntity(
                                      grade: gradeValue,
                                      careerYears: int.parse(
                                        careerYearsController.text,
                                      ),
                                    )
                                  : StudentProfileEntity(
                                      school: schoolController.text,
                                      grade: gradeValue,
                                      guardian: guardianValue,
                                      guardianPhoneNumber:
                                          gdphoneController.text,
                                    ),
                            ),
                          ).then((value) => context.go('/schedule'));
                  },
                  child: Text("회원정보 저장"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
