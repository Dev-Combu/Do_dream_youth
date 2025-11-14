
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AttendanceQrPage extends StatefulWidget{

  const AttendanceQrPage({super.key});

  @override
  State<AttendanceQrPage> createState() => _AttendanceQrPageState();
}

class _AttendanceQrPageState extends State<AttendanceQrPage> {
  final sessionId = '1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('출석 QR')),
      body: Center(
        child: QrImageView(
          data: sessionId,
          version: QrVersions.auto,
          size: 250.0,
        ),
      ),
    );
  }
}
