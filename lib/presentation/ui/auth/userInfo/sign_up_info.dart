import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpInfo extends StatefulWidget {
  const SignUpInfo({super.key, required this.role});
  final String role;

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  TextEditingController pwdController = TextEditingController();

  static List<String> grade = <String>[
    '중학교 1학년',
    '중학교 2학년',
    '중학교 3학년',
    '고등학교 1학년',
    '고등학교 2학년',
    '고등학교 3학년',
  ];
  String dropdownValue = grade.first;

  static List<String> guardian = <String>['부', '모', '기타'];
  String guardianValue = guardian.first;

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("이름"),
                    TextField(controller: pwdController),
                    Text("세례명"),
                    TextField(controller: pwdController),
                    Text("전화번호"),
                    TextField(controller: pwdController),
                    if (widget.role == 'teacher') ...[
                      Text("담당 학년"),
                      TextField(controller: pwdController),
                      Text("담당 부서"),
                      TextField(controller: pwdController),
                    ] else ...[
                      Text("학교"),
                      Row(
                        children: [
                          Expanded(child: TextField(controller: pwdController)),
                          SizedBox(width: 12),
                          DropdownButton<String>(
                            value: dropdownValue,
                            items: grade
                                .map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? v) {
                              setState(() => dropdownValue = v!);
                            },
                          ),
                        ],
                      ),

                      Text("담당(전례, 성가, 둘다, 없음)"),
                      TextField(controller: pwdController),
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
                          Expanded(child: TextField(controller: pwdController)),
                        ],
                      ),
                      TextField(controller: pwdController),
                    ],
                    Text(""),
                    TextField(controller: pwdController),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
