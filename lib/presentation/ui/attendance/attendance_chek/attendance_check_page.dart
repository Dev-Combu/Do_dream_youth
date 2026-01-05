import 'package:do_dream_youth/domain/entity/attendance_st_entity.dart';
import 'package:do_dream_youth/presentation/ui/attendance/attendance_chek/attendance_check_view_model.dart';
import 'package:do_dream_youth/presentation/ui/attendance/attendance_qr/attendance_pr_view_model.dart';
import 'package:do_dream_youth/presentation/config/user_info/user_info_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AttendanceCheckPage extends ConsumerStatefulWidget {
  const AttendanceCheckPage({super.key});

  @override
  ConsumerState<AttendanceCheckPage> createState() =>
      _AttendanceCheckPageState();
}

class _AttendanceCheckPageState extends ConsumerState<AttendanceCheckPage> {
  final MobileScannerController controller = MobileScannerController();
  final _uuid = FirebaseAuth.instance.currentUser!.uid;

  Logger log = Logger();

  String? _detectedUrl;
  bool _isAttending = false;

  @override
  void dispose() {
    // 컨트롤러를 꼭 dispose 해줘야 메모리 누수를 방지합니다!
    controller.dispose();
    super.dispose();
  }

  Future<void> attendance(AttendanceStEntity attendanceStEntity) async {
    try {
      setState(() {
        _isAttending = true;
      });
      log.e("출석체크 시작");
      await Future.delayed(Duration(seconds: 2));
      await ref
          .read(attendanceStViewModel.notifier)
          .attendance(attendanceStEntity);
      if (mounted) {
        log.e("출석체크 성공");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('출석이 성공적으로 처리되었습니다.')));
        context.go('/attendance');
      }
    } catch (e) {
      setState(() {
        _isAttending = false;
      });
      if (e.toString().contains('이미 출석을 완료했습니다.!!') && mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('이미 출석이 완료되었습니다.')));
        context.go('/attendance');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final token = ref.watch(attendancePrViewModel)?.token;
    final userName = ref.watch(userInfoViewModelProvider).value?.name;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Attendance Check'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Stack(
        children: [
          _isAttending
              ? CircularProgressIndicator()
              : MobileScanner(
                  controller: controller,
                  onDetect: (capture) async {
                    final raw = capture.barcodes.first.rawValue ?? '';
                    // --- 🐛 디버깅 출력 추가 시작 ---
                    log.e('--- QR Code Detected ---');
                    log.e('Scanned Raw Value: $raw');
                    log.e('Expected Token: $token');
                    // --- 🐛 디버깅 출력 추가 끝 ---

                    if (raw == token) {
                      setState(() {
                        _detectedUrl = raw;
                      });
                      final attendanceStEntity = AttendanceStEntity(
                        userId: _uuid,
                        name: userName ?? 'Unknown',
                        timestamp: DateTime.now(),
                      );
                      await attendance(attendanceStEntity);
                    }
                  },
                ),
        ],
      ),
    );
  }
}
