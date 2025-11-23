import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AttendanceCheckPage extends StatefulWidget{
  const AttendanceCheckPage({super.key});

  @override
  State<AttendanceCheckPage> createState() => _AttendanceCheckPageState();
}

class _AttendanceCheckPageState extends State<AttendanceCheckPage> {
  final MobileScannerController controller = MobileScannerController();

  String? _detectedUrl;

    @override
  void dispose() {
    // 컨트롤러를 꼭 dispose 해줘야 메모리 누수를 방지합니다!
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              setState((){
                _detectedUrl = raw;
              });
            },
          )
        ],
      )
    );
  }
}