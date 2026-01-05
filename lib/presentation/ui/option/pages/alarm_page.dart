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
          child: Switch(
            value: isChecked,
            onChanged: (value) {
              updateAllAndSync(value);

            },
          ),
        ),
      ),
    );
  }
}
