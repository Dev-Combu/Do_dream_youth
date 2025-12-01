import 'package:do_dream_youth/domain/entity/at_history_entity.dart';
import 'package:do_dream_youth/domain/repository/at_history_repository.dart';

class AtHistoryUsecase {
  AtHistoryUsecase(this._atHistoryRepository);
  final AtHistoryRepository _atHistoryRepository;

  Future<List<AtHistoryEntity>> readAtHistory() {
    return _atHistoryRepository.readAtHistory();
  }
}