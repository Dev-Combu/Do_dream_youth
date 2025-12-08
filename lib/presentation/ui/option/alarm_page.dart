import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('알림 설정')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Switch(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
