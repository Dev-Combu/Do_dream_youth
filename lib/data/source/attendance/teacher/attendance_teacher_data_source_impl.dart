import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_dream_youth/data/dto/attendance_teacher/attendance_teacher_dto.dart';
import 'package:do_dream_youth/data/source/attendance/teacher/attendance_teacher_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class AttendanceTeacherDataSourceImpl implements AttendanceTeacherDataSource{
 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Logger log = Logger();
  final Uuid _uuid = Uuid();


  final String _date = DateFormat('yy.MM.dd').format(DateTime.now());

  @override
  Future<AttendanceTeacherDto> getsetAttendanceToken() async{
    final snapshot = await _firestore
          .collection('tokens')
          .doc(_date)
          .get();
    if(snapshot.exists){
      final data = snapshot.data();
      return AttendanceTeacherDto(
        token: data?['token'] ?? '',
        createdAt: (data?['createdAt'] as Timestamp).toDate(),
      );
    }else{
      final newSecret = _uuid.v4();
      await _firestore
          .collection('tokens')
          .doc(_date)
          .set({
            'token': newSecret,
            'createdAt': DateTime.now(),
          });
      return AttendanceTeacherDto(token: newSecret, createdAt: DateTime.now());
    }
  }
  


}