import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget{
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('공지사항'),
      ),
      body: Center(
        child: Text('공지사항 페이지입니다.'),
      ),
    );
  }
}