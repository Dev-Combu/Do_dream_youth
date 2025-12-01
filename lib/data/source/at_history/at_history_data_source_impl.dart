import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_dream_youth/data/dto/at_history/at_history_dto.dart';
import 'package:do_dream_youth/data/source/at_history/at_history_data_source.dart';
import 'package:logger/logger.dart';

class AtHistoryDataSourceImpl implements AtHistoryDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Logger log = Logger();

  @override
  Future<List<AtHistoryDto>> readAtHistory() async {
    try {
      final docRef = await _firestore
          .collection('attendance_students_all')
          .get();
      final atHistoryList = docRef.docs.expand((doc) {
        final data = doc.data();
        final name = data['name'];

        final attendances = data['attendances'] as Map<String, dynamic>;
        return attendances.entries.map((entry) {
          final value = entry.value;

          return AtHistoryDto(
            userId: doc.id,
            name: name,
            timestamp: value['timestamp'],
          );
        });
      }).toList();
      log.e(atHistoryList);
      return atHistoryList;
    } catch (e) {
      return Future.error(e);
    }
  }
}
