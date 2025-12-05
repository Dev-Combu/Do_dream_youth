import 'package:do_dream_youth/domain/entity/at_history_entity.dart';
import 'package:do_dream_youth/presentation/ui/attendance/at_history/at_history_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AtHistoryViewModel extends Notifier<AtHistoryState> {
  @override
  AtHistoryState build() {
    loadAllHistory(); // 초기 로딩 함수 통합
    return AtHistoryState(); // 초기 상태
  }

  Future<void> loadAllHistory() async {
    // 두 함수를 동시에 호출하고, 완료되면 상태를 한 번에 업데이트할 수 있습니다.
    await Future.wait([loadAtHistorySt(), loadAtHistory()]);
  }

  Future<void> loadAtHistorySt() async {
    try {
      final result = await ref.read(atHistoryUsecaseProvider).readAtHistorySt();
      // 기존 상태를 복사하고 atHistoryStList만 업데이트
      state = state.copyWith(atHistoryStList: result);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loadAtHistory() async {
    try {
      final result = await ref.read(atHistoryUsecaseProvider).readAtHistory();
      // 기존 상태를 복사하고 atHistoryList만 업데이트
      state = state.copyWith(atHistoryList: result);
    } catch (e) {
      rethrow;
    }
  }
}

final atHistoryViewModel = NotifierProvider<AtHistoryViewModel, AtHistoryState>(
  () => AtHistoryViewModel(),
);

class AtHistoryState {
  final List<AtHistoryEntity> atHistoryList; // readAtHistory의 결과
  final List<AtHistoryEntity> atHistoryStList; // readAtHistorySt의 결과

  
  AtHistoryState({
    this.atHistoryList = const [],
    this.atHistoryStList = const [],
  });

  AtHistoryState copyWith({
    List<AtHistoryEntity>? atHistoryList,
    List<AtHistoryEntity>? atHistoryStList,
  }) {
    return AtHistoryState(
      atHistoryList: atHistoryList ?? this.atHistoryList,
      atHistoryStList: atHistoryStList ?? this.atHistoryStList,
    );
  }
}
