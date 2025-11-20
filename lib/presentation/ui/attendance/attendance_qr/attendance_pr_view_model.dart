import 'package:do_dream_youth/domain/entity/attendance_teacher_entity.dart';
import 'package:do_dream_youth/presentation/ui/attendance/attendance_qr/attendance_pr_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendancePrViewModel extends Notifier<AttendanceTeacherEntity?> {
  @override
  AttendanceTeacherEntity? build() {
    generateQrCode();
    return null;
  }

  void generateQrCode() {
    ref.read(qrUsecaseProvider).getsetAttendanceToken().then((tokenEntity) {
      state = tokenEntity;
    }).catchError((error) {
      state = null;
    });
  }

}

final attendancePrViewModel =
    NotifierProvider<AttendancePrViewModel, AttendanceTeacherEntity?>(
        () => AttendancePrViewModel());