import 'package:do_dream_youth/domain/entity/at_history_entity.dart';

abstract class AtHistoryRepository {
  Future<List<AtHistoryEntity>> readAtHistorySt();
  Future<List<AtHistoryEntity>> readAtHistory();
}