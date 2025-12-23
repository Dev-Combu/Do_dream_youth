import 'dart:math';

import 'package:do_dream_youth/domain/entity/schedule_entity.dart';
import 'package:do_dream_youth/presentation/ui/schedule/schedule_create_update/schedule_cu_view_model.dart';
import 'package:do_dream_youth/presentation/ui/schedule/schedule_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class ScheduleCreateUpdatePage extends ConsumerStatefulWidget {
  const ScheduleCreateUpdatePage({
    super.key,
    this.id,
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.target,
    required this.editing,
  });
  final String? id;
  final String? name;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? target;
  final bool editing;

  @override
  ConsumerState<ScheduleCreateUpdatePage> createState() =>
      _ScheduleCreateUpdatePageState();
}

class _ScheduleCreateUpdatePageState extends ConsumerState<ScheduleCreateUpdatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController targetController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime? startDate;
  DateTime? endDate;
  TextDirection textDirection = TextDirection.ltr;

  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24HourTime = false;
  DateTime now = DateTime.now();

  Logger log = Logger();

  @override
  void initState() {
    super.initState();
    if (widget.editing) {
      nameController.text = widget.name ?? '';
      descriptionController.text = widget.description ?? '';
      targetController.text = widget.target ?? '';
      startDate = widget.startDate;
      endDate = widget.endDate;
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

    // 2. 시간 선택 (날짜 선택 직후 바로 실행)
    final TimeOfDay? pickedtime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      // 기존 코드에 있던 테마 설정 유지
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // materialTapTargetSize: tapTargetSize, // 필요한 경우 주석 해제
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              // alwaysUse24HourFormat: use24HourTime, // 필요한 경우 주석 해제
            ),
            child: child!,
          ),
        );
      },
    );

    if (pickedtime == null) return; // 날짜 선택 취소 시 중단
    final DateTime result = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedtime.hour,
      pickedtime.minute,
    );
      setState(() {
    selectedDate = pickedDate;
    selectedTime = pickedtime;

    if (isStart) {
      startDate = result;
    } else {
      endDate = result;
    }
  });
  }

  Future<void> createSchedule(ScheduleEntity scheduleInfo)async{
    try{
      await ref
        .read(fetchscheduleUsecaseProvider)
        .createSchedule(scheduleInfo);
    }catch(e){
      log.e(e);
    }
  }

  Future<void> updateSchedule(ScheduleEntity scheduleInfo, String scheduleId)async{
    try{
      await ref
        .read(fetchscheduleUsecaseProvider)
        .updateSchedule(scheduleInfo, scheduleId);
    }catch(e){
      log.e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.editing ? '일정 수정' : '일정 생성')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
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
                      TextField(
                        controller: nameController,
                        style: const TextStyle(fontSize: 24),
                        decoration: InputDecoration(
                          labelText: '제목',
                          hintText: '제목',
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // 선택된 날짜와 시간 표시
                              Text(
                                (startDate != null)
                                    ? '${startDate?.year}/${startDate?.month}/${startDate?.day} ${startDate?.hour}:${startDate?.minute}'
                                    : '시작 날짜 및 시간',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // 통합된 선택 버튼
                              ElevatedButton.icon(
                                onPressed: (){_pickDateTime(true);}, // 위에서 만든 함수 호출
                                icon: const Icon(Icons.calendar_today),
                                label: const Text('시작 시간'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(' ~ '),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // 선택된 날짜와 시간 표시
                              Text(
                                (endDate != null)
                                    ? '${endDate?.year}/${endDate?.month}/${endDate?.day} ${endDate?.hour}:${endDate?.minute}'
                                    : '끝 날짜 및 시간',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // 통합된 선택 버튼
                              ElevatedButton.icon(
                                onPressed: (){_pickDateTime(false);}, // 위에서 만든 함수 호출
                                icon: const Icon(Icons.calendar_today),
                                label: const Text('끝 시간'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: targetController,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: '대상',
                          hintText: '대상',
                        ),
                      ),
                      Divider(height: 32, color: Colors.grey),
                      Expanded(
                        child: TextField(
                          controller: descriptionController,
                          style: const TextStyle(fontSize: 16),
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            labelText: '내용',
                            hintText: '내용',
                          ),
                          maxLines: null,
                          expands: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: ElevatedButton(
              onPressed: () {
                widget.editing
                    ? updateSchedule(
                        ScheduleEntity(
                          name: nameController.text,
                          startDate: startDate!,
                          endDate: endDate!,
                          target: targetController.text,
                          description: descriptionController.text,
                        ),
                        widget.id!,
                      )
                    : createSchedule(
                        ScheduleEntity(
                          name: nameController.text,
                          startDate: startDate!,
                          endDate: endDate!,
                          target: targetController.text,
                          description: descriptionController.text,
                        ),
                      );
                context.pop();
                context.pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                widget.editing ? '수정' : '생성',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
