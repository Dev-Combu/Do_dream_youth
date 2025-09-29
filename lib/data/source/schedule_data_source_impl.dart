import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_dream_youth/data/dto/schedule/schedule_dto.dart';
import 'package:do_dream_youth/data/source/schedule_data_source.dart';
import 'package:logger/logger.dart';

class ScheduleDataSourceImpl implements ScheduleDataSource{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Logger logger = Logger();

  @override
  Stream<List<ScheduleDto>> readBook() {
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
}