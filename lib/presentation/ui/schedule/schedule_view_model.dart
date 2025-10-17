import 'package:do_dream_youth/domain/entity/schedule_entity.dart';
import 'package:do_dream_youth/presentation/ui/schedule/schedule_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleViewModel  extends Notifier<List<ScheduleEntity>?>{
  @override
  List<ScheduleEntity> build() {
    fetchSchedule();
    return [];
  }

  void fetchSchedule() {
    final stream = ref.read(fetchscheduleUsecaseProvider).readSchedule();

    final streamSubscription = stream.listen((e) {
      state = e;
    });
    ref.onDispose(() {
      streamSubscription.cancel();
    });
  }
}

final scheduleViewModel = NotifierProvider<ScheduleViewModel, List<ScheduleEntity>?>(
    () => ScheduleViewModel());