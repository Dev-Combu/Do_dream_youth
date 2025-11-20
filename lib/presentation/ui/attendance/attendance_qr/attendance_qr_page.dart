import 'package:do_dream_youth/presentation/ui/attendance/attendance_qr/attendance_pr_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AttendanceQrPage extends ConsumerStatefulWidget {
  const AttendanceQrPage({super.key});

  @override
  ConsumerState<AttendanceQrPage> createState() => _AttendanceQrPageState();
}

class _AttendanceQrPageState extends ConsumerState<AttendanceQrPage> {
  final sessionId = '1';
  String? token;
  final _auth = FirebaseAuth.instance;
  Logger logger = Logger();



  @override
  Widget build(BuildContext context) {
    final token = ref.watch(attendancePrViewModel)?.token;
    return Scaffold(
      appBar: AppBar(title: const Text('출석 QR')),
      body: Center(
        child: token == null
            ? const CircularProgressIndicator()
            : QrImageView(
                data: token,
                size: 250,
              ),
      ),
    );
  }
}
