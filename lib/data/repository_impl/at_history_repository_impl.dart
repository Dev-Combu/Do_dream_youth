import 'package:do_dream_youth/data/source/at_history/at_history_data_source.dart';
import 'package:do_dream_youth/domain/entity/at_history_entity.dart';
import 'package:do_dream_youth/domain/repository/at_history_repository.dart';

class AtHistoryRepositoryImpl implements AtHistoryRepository{
  AtHistoryRepositoryImpl(this._atHistoryDataSource);
  final AtHistoryDataSource _atHistoryDataSource;

  @override
  Future<List<AtHistoryEntity>> readAtHistory() async{
    final result = await _atHistoryDataSource.readAtHistory();
    return result.map((dto) => AtHistoryEntity(
      name: dto.name,
      userId: dto.userId,
      timestamp: dto.timestamp,
    )).toList();
  }
}
