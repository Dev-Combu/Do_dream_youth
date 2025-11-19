import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AttendanceQrPage extends StatefulWidget {
  const AttendanceQrPage({super.key});

  @override
  State<AttendanceQrPage> createState() => _AttendanceQrPageState();
}

class _AttendanceQrPageState extends State<AttendanceQrPage> {
  final sessionId = '1';
  String? token;
  final _auth = FirebaseAuth.instance;
  Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  /// Custom Token 생성 함수
  Future<String> _getCustomToken(String uid) async {
    final functions = FirebaseFunctions.instance;
    final callable = functions.httpsCallable('createCustomToken');
    logger.d('Current callable: $callable');

    final response = await callable.call({'uid': 's7bZ7cF4AhPqxgO49W15GVgkgdd2'});
    logger.d('Current response: $response');

    return response.data['token'];
  }

  /// 토큰 로딩 + 익명 로그인 처리
  Future<void> _loadToken() async {
    final uuid =  _auth.currentUser!.uid;
    logger.d('Current UID: $uuid');

    // Cloud Functions 호출
    final t = await _getCustomToken('s7bZ7cF4AhPqxgO49W15GVgkgdd2');
    
    logger.d('Current t: $t');

    setState(() {
      token = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('출석 QR')),
      body: Center(
        child: token == null
            ? const CircularProgressIndicator()
            : QrImageView(
                data: '$sessionId+$token',
                size: 250,
              ),
      ),
    );
  }
}
