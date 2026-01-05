import 'package:do_dream_youth/presentation/ui/schedule/schedule_create_update/schedule_create_update_page.dart';
import 'package:do_dream_youth/presentation/ui/schedule/schedule_detail/schedule_delete_view_model.dart';
import 'package:do_dream_youth/presentation/ui/schedule/schedule_view_model.dart';
import 'package:do_dream_youth/presentation/config/user_info/user_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SchdeuleDetailPage extends ConsumerStatefulWidget {
  const SchdeuleDetailPage({
    super.key,
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.target,
  });
  final String id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String target;

  @override
  ConsumerState<SchdeuleDetailPage> createState() => _SchdeuleDetailPageState();
}

class _SchdeuleDetailPageState extends ConsumerState<SchdeuleDetailPage> {
   String formattedDate(DateTime date) =>
      DateFormat("yy년 MM월 dd일 hh:mm").format(date);
  
      
  @override
  Widget build(BuildContext context) {
    String role = ref.read(userInfoViewModelProvider).value?.role ?? '';
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('일정 상세'),
        actions: [
          if (role == 'teacher') ...[
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScheduleCreateUpdatePage(
                      id: widget.id,
                      editing: true,
                      name: widget.name,
                      description: widget.description,
                      startDate: widget.startDate,
                      endDate: widget.endDate,
                      target: widget.target,
                    ),
                  ),
                );
              },
              child: Text(
                '수정',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('일정 삭제'),
                      content: Text('정말 이 일정을 삭제하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ref
                                .read(scheduleDeleteViewModel.notifier)
                                .deleteSchedule(widget.id);
                            context.pop();
                            context.pop();
                          },
                          child: Text('삭제'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('취소'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                      '대상: ${widget.target}',
                      style: const TextStyle(fontSize: 16),
                    ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      '${formattedDate(widget.startDate)} ~ ${formattedDate(widget.endDate)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Spacer(),
                  ],
                ),
                Divider(height: 32, color: Colors.grey),
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
