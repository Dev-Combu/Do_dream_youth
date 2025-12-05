import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_dream_youth/data/dto/at_history/at_history_dto.dart';
import 'package:do_dream_youth/data/source/at_history/at_history_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AtHistoryDataSourceImpl implements AtHistoryDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Logger log = Logger();
  final String _uuid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<List<AtHistoryDto>> readAtHistorySt() async {
    try {
      final docRef = _firestore
          .collection('attendance_students_all')
          .doc(_uuid);
      final attendanceRef = await docRef.collection('attendance_history').get();

      final atHistoryList = attendanceRef.docs.map(
        (doc) => AtHistoryDto(
          name: doc['name'],
          timestamp: doc['timestamp'].toDate(),
          userId: _uuid,
          grade: doc['grade']
        ),
      );
      return atHistoryList.toList();
    } catch (e) {
      log.i('e: $e');
      return Future.error(e);
    }
  }
  
  @override
  Future<List<AtHistoryDto>> readAtHistory() async{
    try{
      final docref = _firestore
          .collection('attendance_students_all');
      final attendanceRef = await docref.get();
      final atHistoryList = <AtHistoryDto>[];
      
      for (var doc in attendanceRef.docs) {
        final querySnapshot = await doc.reference.collection('attendance_history').get();
        for (var historyDoc in querySnapshot.docs) {
          atHistoryList.add(
            AtHistoryDto(
              name: historyDoc['name'],
              timestamp: historyDoc['timestamp'].toDate(),
              userId: doc.id,
              grade: historyDoc['grade']
            ),
          );
        }
      }
      return atHistoryList;
    } catch (e) {
      log.i('e: $e');
      return Future.error(e);
    }
  }
}
