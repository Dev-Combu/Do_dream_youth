import 'package:flutter/material.dart';

class ThemeSettingPage extends StatefulWidget{
  const ThemeSettingPage({super.key});

  @override
  State<ThemeSettingPage> createState() => _ThemeSettingPageState();
}

class _ThemeSettingPageState extends State<ThemeSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('테마 설정'),
      ),
      body: Center(
        child: Text('테마 설정 페이지입니다.'),
      ),
    );
  }
}