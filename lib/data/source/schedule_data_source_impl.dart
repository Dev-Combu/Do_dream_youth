import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_dream_youth/data/dto/schedule/schedule_dto.dart';
import 'package:do_dream_youth/data/source/schedule_data_source.dart';
import 'package:logger/logger.dart';

class ScheduleDataSourceImpl implements ScheduleDataSource{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Logger log = Logger();

  @override
  Stream<List<ScheduleDto>> readSchedule() {
    final collectionRef = _firestore.collection('schedule');
    final result = collectionRef.snapshots();

    final stream = result.map((snapshot) {
      final docs = snapshot.docs.map((doc) {
        final map = doc.data();
        final newMap = {
          'id': doc.id,
          ...map,
        };
        return ScheduleDto.fromJson(newMap);
      }).toList();
      return docs;
    });
    return stream;
  }
  
  @override
  Future<void> createSchedule(ScheduleDto scheduleInfo) async{
    try{
      await _firestore
      .collection('schedule')
      .doc()
      .set(scheduleInfo.toJson());
    }catch(e){
      log.i('e: $e');
    }
  }

  @override
  Future<void> updateSchedule(ScheduleDto scheduleInfo, String scheduleId) async {
    try {
      await _firestore
          .collection('schedule')
          .doc(scheduleId)
          .update(scheduleInfo.toJson());
    } catch (e) {
      log.i('e: $e');
      log.i('scheduleInfo.id: ${scheduleInfo.id}');
    }
  }

  @override
  Future<void> deleteSchedule(String scheduleId) async {
    try {
      await _firestore.collection('schedule').doc(scheduleId).delete();
    } catch (e) {
      log.i('e: $e');
    }
  }
}