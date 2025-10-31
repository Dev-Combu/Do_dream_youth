
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AttendanceQrPage extends StatelessWidget{
  final String sessionId;

  const AttendanceQrPage({super.key, required this.sessionId});


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
