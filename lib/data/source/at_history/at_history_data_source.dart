import 'package:do_dream_youth/data/dto/at_history/at_history_dto.dart';

abstract class AtHistoryDataSource {
  Future<List<AtHistoryDto>> readAtHistory();
  Future<List<AtHistoryDto>> readAtHistorySt();
}