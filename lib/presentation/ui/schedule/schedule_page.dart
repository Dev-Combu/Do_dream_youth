import 'package:do_dream_youth/domain/entity/schedule_entity.dart';
import 'package:do_dream_youth/presentation/ui/schedule/schedule_detail/schdeule_detail_page.dart';
import 'package:do_dream_youth/presentation/ui/schedule/schedule_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class SchedulePage extends ConsumerStatefulWidget {
  const SchedulePage({super.key});

  @override
  ConsumerState<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends ConsumerState<SchedulePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  late final Map<DateTime, List<ScheduleEntity>> _eventsByDay = {};

  @override
  void initState() {
    super.initState();
  }

  DateTime _dateOnly(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

  List<DateTime> _daysInRange(DateTime start, DateTime end) {
    final days = <DateTime>[];
    DateTime current = _dateOnly(start);
    final last = _dateOnly(end);
    while (!current.isAfter(last)) {
      days.add(current);
      current = current.add(const Duration(days: 1));
    }
    return days;
  }

  void _buildEventsMap(List<ScheduleEntity> schedules) {
    _eventsByDay.clear();
    for (final s in schedules) {
      final start = s.startDate;
      final end = s.endDate;

      for (final d in _daysInRange(start, end)) {
        final key = _dateOnly(d);
        _eventsByDay.putIfAbsent(key, () => []);
        _eventsByDay[key]!.add(s);
      }
    }
  }

  List<ScheduleEntity> _getEventsForDay(DateTime day) {
    return _eventsByDay[_dateOnly(day)] ?? [];
  }

  String formattedDate(DateTime date) =>
      DateFormat("yyyy년 MM월 dd일").format(date);

  @override
  Widget build(BuildContext context) {
    // scheduleList가 업데이트될 때마다 이벤트 맵 생성
    ref.listen<List<ScheduleEntity>?>(scheduleViewModel, (previous, next) {
      if (next != null) {
        setState(() {
          _buildEventsMap(next);
        });
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('성당 일정')),
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar<ScheduleEntity>(
              locale: 'ko_KR',
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false, // 월/주 버튼 숨기기
              ),
              eventLoader: _getEventsForDay,
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  if (events.isEmpty) return const SizedBox.shrink();
                  return Positioned(
                    bottom: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        events.length.clamp(0, 3),
                        (i) => Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: _getEventsForDay(_selectedDay ?? _focusedDay).isEmpty
                  ? Center(
                      child: Text(
                        '선택한 날짜에 일정이 없습니다.',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    )
                  : ListView.separated(
                      itemCount: _selectedDay != null
                          ? _getEventsForDay(_selectedDay!).length
                          : _getEventsForDay(_focusedDay).length,
                      separatorBuilder: (_, __) =>
                          const Divider(color: Color(0xFFE5E8EB)),
                      itemBuilder: (context, index) {
                        final result = _selectedDay != null
                            ? _getEventsForDay(_selectedDay!)[index]
                            : _getEventsForDay(_focusedDay)[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SchdeuleDetailPage(
                                  name: result.name,
                                  description: result.description,
                                  startDate: formattedDate(result.startDate),
                                  endDate: formattedDate(result.endDate),
                                  target: result.target,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(result.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${formattedDate(result.startDate)} - ${formattedDate(result.endDate)}',
                                ),
                                const SizedBox(height: 4),
                                Text(result.target),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
