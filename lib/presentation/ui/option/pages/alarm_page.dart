import 'package:do_dream_youth/presentation/config/notifications/notification_view_model.dart';
import 'package:do_dream_youth/presentation/config/user_info/user_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlarmPage extends ConsumerStatefulWidget {
  const AlarmPage({super.key});

  @override
  ConsumerState<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends ConsumerState<AlarmPage> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    initializeNotificationStatus();
  }

  Future<void> initializeNotificationStatus() async {
    final notificationsStatus = await ref.read(notificationViewModelProvider.notifier).getNotificationStatus();
    setState(() {
      isChecked = notificationsStatus;
    });
  }

  Future<void> updateAllAndSync(bool isEnabled) async {
    setState(() {
      isChecked = isEnabled;
    });
    await ref
        .read(notificationViewModelProvider.notifier)
        .updateAllAndSync(isEnabled);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('알림 설정')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Text('전체 알림 설정'),
                  Spacer(),
                  Text(!isChecked ? '켜짐' : '꺼짐'),
                  VerticalDivider(
                    color: Colors.grey, // 선 색상
                    thickness: 1, // 선 두께
                    width: 20, // 선 양옆의 여백을 포함한 전체 너비
                    indent: 10, // 위쪽 여백
                    endIndent: 10, // 아래쪽 여백
                  ),
                  Switch(
                    value: isChecked,
                    onChanged: (value) {
                      updateAllAndSync(value);
                    },
                    // 켜졌을 때 설정
                    activeColor: Colors.grey, // 켜진 상태의 동그라미(핸들) 색상
                    activeTrackColor: Colors.black12, // 켜진 상태의 배경(트랙) 색상
                    // 꺼졌을 때 설정 (필요시)
                    inactiveThumbColor: Colors.white, // 꺼진 상태의 동그라미 색상
                    inactiveTrackColor: Colors.blue, // 꺼진 상태의 배경 색상
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
