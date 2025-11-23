import 'package:do_dream_youth/presentation/ui/widgets/user_info/user_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AttendancePage extends ConsumerStatefulWidget {
  const AttendancePage({super.key});

  @override
  ConsumerState<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends ConsumerState<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    final user_role = ref.read(userInfoViewModelProvider)?.role;
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
                  user_role == "student"
                  ? context.push('/attendance_check')
                  : context.push('/attendance_qr');
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
