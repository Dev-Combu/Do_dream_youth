import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_dream_youth/data/dto/attendance_student/attendance_st_dto.dart';
import 'package:do_dream_youth/data/source/attendance/student/attendance_st_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class AttendanceStDataSourceImpl implements AttendanceStDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _date = DateFormat('yyyy.MM.dd').format(DateTime.now());
  final _uuid = FirebaseAuth.instance.currentUser?.uid;
  Logger log = Logger();

  @override
  Future<void> createAttendance(AttendanceStDto attendanceStDto) async {
    try {
      // 1. 해당 학생의 문서 경로 지정
      final studentDocRef = _firestore
          .collection('attendance_students_all')
          .doc(_uuid);

      // 2. 해당 학생 문서 내의 서브 컬렉션 경로 지정
      final historyDocRef = studentDocRef
          .collection('attendance_history')
          .doc(_date);

      // 3. 서브 컬렉션에 기록할 데이터
      final attendanceRecord = {
        'name': attendanceStDto.toJson()['name'],
        'status': 'attended',
        'timestamp': FieldValue.serverTimestamp(),
      };

      // 4. 서브 컬렉션의 문서에 데이터 저장 (덮어쓰기)
      await historyDocRef.set(attendanceRecord, SetOptions(merge: true));

      await studentDocRef.set({
        'last_attendance_date': _date,
        'name': attendanceStDto.toJson()['name'],
      }, SetOptions(merge: true));
    } catch (e, stackTrace) {
      log.i('e: $e, stack: $stackTrace');
      return Future.error(e);
    }
  }

  // @override
  // Future<void> createAttendance(AttendanceStDto attendanceStDto) async {
  //   final docRef = _firestore.collection('attendance_students').doc(_date);
  //   final studentData = {_uuid: attendanceStDto.toJson()};

  //   final docRefAll = _firestore
  //       .collection('attendance_students_all')
  //       .doc(_uuid);
  //   final studentDataAll = {
  //     'name': attendanceStDto.toJson()['name'],
  //     'attendances': {
  //       _date: {
  //         'timestamp': FieldValue.serverTimestamp(),
  //         'status': 'attended',
  //       },
  //     },
  //   };

  //   final batch = _firestore.batch();

  //   try {
  //     final snapshot = await docRef.get();
  //     if (snapshot.exists && snapshot.data()!.containsKey(_uuid)) {
  //       log.i('User $_uuid has already attended on $_date. Skipping write.');
  //       return Future.error('이미 출석을 완료했습니다.!!');
  //     }

  //     batch.set(docRefAll, studentDataAll, SetOptions(merge: true));
  //     batch.set(docRef, studentData, SetOptions(merge: true));

  //     await batch.commit();

  //     return;

  //   } catch (e, stackTrace) {
  //     log.i('e: $e, stack: $stackTrace');
  //     return Future.error(e);
  //   }
  // }
}
