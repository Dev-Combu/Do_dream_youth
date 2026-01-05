import 'package:do_dream_youth/presentation/ui/option/pages/alarm_page.dart';
import 'package:do_dream_youth/presentation/ui/option/pages/app_version_page.dart';
import 'package:do_dream_youth/presentation/ui/option/pages/notice_page.dart';
import 'package:do_dream_youth/presentation/ui/option/pages/theme_setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Logger log = Logger();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('설정')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  context.go('/my_info');
                },
                child: Text(
                  '내 정보 보기',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlarmPage()),
                );
              },
              child: Text(
                '알림 수신 설정',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemeSettingPage()),
                );
              },
              child: Text(
                '테마 설정',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoticePage()),
                );
              },
              child: Text(
                '공지사항',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppVersionPage()),
                );
              },
              child: Text(
                '앱 버전 정보',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Divider(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('로그아웃'),
                      content: Text('정말 로그아웃 하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () async{
                            await FirebaseAuth.instance.signOut();
                          },
                          child: Text('로그아웃'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('취소'),
                        ),
                      ],
                    );
                  },
                );
            },
            child: Text('로그아웃'),
          ),
        ),
      ),
    );
  }
}
