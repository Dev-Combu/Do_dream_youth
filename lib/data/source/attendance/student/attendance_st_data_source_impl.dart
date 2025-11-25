import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_dream_youth/data/dto/attendance_student/attendance_st_dto.dart';
import 'package:do_dream_youth/data/dto/user_info_dto.dart';
import 'package:do_dream_youth/data/source/attendance/student/attendance_st_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class AttendanceStDataSourceImpl implements AttendanceStDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _date = DateFormat('yy.MM.dd').format(DateTime.now());
  final _uuid = FirebaseAuth.instance.currentUser?.uid;
  Logger log = Logger();

  @override
  Future<void> createAttendance(AttendanceStDto attendanceStDto) async {
    final snapshot = await _firestore
        .collection('attendance_students')
        .doc(_date)
        .get();
    try {
      if (!snapshot.exists) {
        await _firestore
            .collection('user_info')
            .doc(_uuid)
            .set(attendanceStDto.toJson());
      }
      return ;
    } catch (e, stackTrace) {
      log.i('e: $e, stack: $stackTrace');
      return Future.error(e);
    }
  }

  Future<String> getUserName() async {
    try {
      final doc = await _firestore.collection('user_info').doc(_uuid).get();
      final docs = doc.data() as Map<String, dynamic>;
      return UserInfoDto.fromJson(docs).name;
    } catch (e, stackTrace) {
      log.i('e: $e, stack: $stackTrace');
      return Future.error(e);
    }
  }
}
