import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_dream_youth/data/dto/attendance_student/attendance_st_dto.dart';
import 'package:do_dream_youth/data/source/attendance/student/attendance_st_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class AttendanceStDataSourceImpl implements AttendanceStDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _date = DateFormat('yy.MM.dd').format(DateTime.now());
  final _uuid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<AttendanceStDto> createAttendance() async{
    final snapshot = await _firestore
          .collection('attendance_students')
          .doc(_date)
          .get();
          if(snapshot.exists){
            final data = snapshot.data();
            return AttendanceStDto(userId: _uuid ?? 'null', name: 'name', timestamp: DateTime.now());
          }else{
            return  AttendanceStDto(userId: _uuid ?? 'null', name: 'name', timestamp: DateTime.now());
          }
    
  }
}
