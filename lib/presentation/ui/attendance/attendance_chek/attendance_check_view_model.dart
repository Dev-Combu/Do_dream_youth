import 'package:do_dream_youth/domain/entity/attendance_st_entity.dart';
import 'package:do_dream_youth/presentation/ui/attendance/attendance_chek/attendance_check_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceCheckViewModel extends Notifier<AttendanceStEntity?>{
  @override
  AttendanceStEntity? build() {
    return null;
  }

Future<void> attendance(AttendanceStEntity attendanceStEntity) async{
  try{
    await ref.read(atUsecaseProvider).attendanceSt(attendanceStEntity);
    state = attendanceStEntity;
  }catch(e){
    rethrow;
  }
}

}

final attendanceStViewModel =
    NotifierProvider<AttendanceCheckViewModel, AttendanceStEntity?>(
        () => AttendanceCheckViewModel());