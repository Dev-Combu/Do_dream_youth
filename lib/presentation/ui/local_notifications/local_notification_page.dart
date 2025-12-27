import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LocalNotificationPage extends StatefulWidget {
  const LocalNotificationPage({super.key});

  @override
  State<LocalNotificationPage> createState() => _LocalNotificationPageState();
}

class _LocalNotificationPageState extends State<LocalNotificationPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  Logger log = Logger();

  final List<bool> _isSelected = [true, false, false, false];
  final List<String> _topics = [
    'allUsers',
    'middleSchool',
    'highSchool',
    'etc',
  ];
  final List<String> _topicLabels = ['전체 사용자', '중등부', '고등부', '기타'];
  final List<String> _selectedTopics = [];

  DateTime? notificaiontime;
  TimeOfDay? selectedTime;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _updateSelectedTopics();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> sendNotificationToAllUsers(String title, String body) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    try {
      await FirebaseFunctions.instance
          .httpsCallable('sendScheduleNotification')
          .call({'title': title, 'body': body, 'topics': _selectedTopics, 'sendTime': notificaiontime?.toUtc().toIso8601String()});
          log.d(notificaiontime);
    } catch (e) {
      log.d(e);
    }
  }

  void _updateSelectedTopics() {
    _selectedTopics.clear(); // 기존 목록 초기화
    for (int i = 0; i < _isSelected.length; i++) {
      if (_isSelected[i]) {
        _selectedTopics.add(_topics[i]);
      }
    }
  }

  Future<void> _pickDateTime(bool isStart) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year, now.month, now.day),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (pickedDate == null) return; // 날짜 선택 취소 시 중단

    final TimeOfDay? pickedtime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      // 기존 코드에 있던 테마 설정 유지
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(),
            child: child!,
          ),
        );
      },
    );

    if (pickedtime == null) return;
    final DateTime result = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedtime.hour,
      pickedtime.minute,
    );

    setState(() {
      if (isStart) {
        notificaiontime = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('알림 생성')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ToggleButtons(
                isSelected: _isSelected,
                onPressed: (int index) {
                  setState(() {
                    if (index == 0) {
                      if (_isSelected[0]) {
                        _isSelected[0] = false;
                      } else {
                        _isSelected[0] = true;
                        for (int i = 1; i < _isSelected.length; i++) {
                          _isSelected[i] = false;
                        }
                      }
                    } else {
                      if (_isSelected[0]) {
                        _isSelected[0] = false;
                      }
                      _isSelected[index] = !_isSelected[index];
                    }
                    _updateSelectedTopics();
                  });
                },
                selectedBorderColor: Colors.blue,
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
                children: _topicLabels
                    .map(
                      (label) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(label),
                      ),
                    )
                    .toList(),
              ),
              if(_selectedTopics.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '하나 이상의 대상을 선택하세요.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 16),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: '제목'),
              ),
              SizedBox(height: 16),
              Expanded(
                child: TextField(
                  controller: _bodyController,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(labelText: '내용'),
                  maxLines: null,
                  expands: true,
                ),
              ),
              SizedBox(height: 16),
              Text("알림 발송 시간 | 시간 선택 안할 시 즉시 발송"),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    notificaiontime == null
                        ? '시간 선택 안됨'
                        : '예약 시간: ${notificaiontime!.year}/${notificaiontime!.month}/${notificaiontime!.day} ${notificaiontime!.hour}:${notificaiontime!.minute.toString().padLeft(2, '0')}',
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {
                      _pickDateTime(true);
                    }, // 위에서 만든 함수 호출
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('시간'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        notificaiontime = null;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Icon(Icons.refresh),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      final title = _titleController.text;
                      final body = _bodyController.text;
                      sendNotificationToAllUsers(title, body);
                    },
                    child: Text("알림 보내기", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
