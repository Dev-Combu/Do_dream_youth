import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Attendance'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 150,
              ),
            ),
            Padding(padding:  const EdgeInsets.all(8.0)),
            Flexible(
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: () {
                  context.push('/attendance_qr');

                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
