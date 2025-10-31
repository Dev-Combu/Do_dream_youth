import 'package:flutter/material.dart';

class AttendanceCheckPage extends StatelessWidget{
  const AttendanceCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Attendance Check'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Center(
        child: Text('출석 체크 페이지'),
      ),
    );
  }
}