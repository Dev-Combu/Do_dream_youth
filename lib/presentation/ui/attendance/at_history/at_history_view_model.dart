import 'package:do_dream_youth/domain/entity/at_history_entity.dart';
import 'package:do_dream_youth/presentation/ui/attendance/at_history/at_history_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AtHistoryViewModel extends Notifier<List<AtHistoryEntity>>{
  @override
  build() {
    return [];
  }
  Future<void> loadAtHistory() async{
    try{
      final result = await ref.read(atHistoryUsecaseProvider).readAtHistory();
      state = result;
    }catch(e){
      rethrow;
    }
  }

}

final atHistoryViewModel =
    NotifierProvider<AtHistoryViewModel, List<AtHistoryEntity>>(
        () => AtHistoryViewModel());