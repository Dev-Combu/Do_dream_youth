import 'package:do_dream_youth/domain/entity/attendance_st_entity.dart';
import 'package:do_dream_youth/presentation/ui/attendance/attendance_chek/attendance_check_view_model.dart';
import 'package:do_dream_youth/presentation/ui/attendance/attendance_qr/attendance_pr_view_model.dart';
import 'package:do_dream_youth/presentation/ui/widgets/user_info/user_info_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AttendanceCheckPage extends ConsumerStatefulWidget{
  const AttendanceCheckPage({super.key});

  @override
  ConsumerState<AttendanceCheckPage> createState() =>
      _AttendanceCheckPageState();
}

class _AttendanceCheckPageState extends ConsumerState<AttendanceCheckPage> {
  final MobileScannerController controller = MobileScannerController();
  final _uuid = FirebaseAuth.instance.currentUser!.uid;

  String? _detectedUrl;

  @override
  void dispose() {
    // 컨트롤러를 꼭 dispose 해줘야 메모리 누수를 방지합니다!
    controller.dispose();
    super.dispose();
  }

  Future<void> attendance(AttendanceStEntity attendanceStEntity) async {
    try {
      await ref
          .read(attendanceStViewModel.notifier)
          .attendance(attendanceStEntity);
    } catch (e) {
      // 에러 처리 로직 추가
    }
  }

  @override
  Widget build(BuildContext context) {
    final token = ref.watch(attendancePrViewModel)?.token;
    final userName = ref.watch(userInfoViewModelProvider)!.name;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Attendance Check'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (capture) async{
              final raw = capture.barcodes.first.rawValue ?? '';
              if(raw == token){
                setState(() {
                  _detectedUrl = raw;
                });
                final attendanceStEntity = AttendanceStEntity(
                  userId: _uuid,
                  name: userName,
                  timestamp: DateTime.now(),
                );
                await attendance(attendanceStEntity);
              }
            },
          )
        ],
      )
    );
  }
}