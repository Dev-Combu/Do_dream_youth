import 'dart:developer';

import 'package:do_dream_youth/presentation/ui/attendance/at_history/at_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class PageAtHistoryTeacher extends ConsumerStatefulWidget {
  const PageAtHistoryTeacher({super.key});

  @override
  ConsumerState<PageAtHistoryTeacher> createState() =>
      _PageAtHistoryTeacherState();
}

class _PageAtHistoryTeacherState extends ConsumerState<PageAtHistoryTeacher> {
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  String searchName = '';
  String? grades;
  List<String> items = ['선택', '중학교 1학년', '중 2', '중 3', '고 1', '고 2', '고 3'];
  Logger log = Logger();
  @override
  void initState() {
    super.initState();
    grades = items.first;
  }

  List<DateTime> getSundaysInMonth(int year, int month) {
    List<DateTime> sundays = [];
    // 해당 월의 마지막 날짜 구하기 (다음 달 0일 = 이번 달 말일)
    int daysInMonth = DateTime(year, month + 1, 0).day;

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(year, month, day);
      if (date.weekday == DateTime.sunday) {
        sundays.add(date);
      }
    }
    return sundays;
  }

  @override
  Widget build(BuildContext context) {
    final List<DateTime> sundays = getSundaysInMonth(year, month);
    final atAll = ref.watch(atHistoryViewModel).atHistoryList;
    final filteredAttendances = atAll.where((attendance) {
      final lowerName = attendance.name.toLowerCase();
      final lowerGrade = attendance.grade.toLowerCase();

      bool matchesName =
          searchName.isEmpty || lowerName.contains(searchName.toLowerCase());

      bool matchesGrade =
          (grades == '선택') || lowerGrade.contains(grades!.toLowerCase());

      return matchesName && matchesGrade; // AND 조건으로 반드시 둘 다 만족
    }).toList();
    Map<String, List<DateTime>> studentAttendanceMap = {};
    for (var attendance in filteredAttendances) {
      if (!studentAttendanceMap.containsKey(attendance.name)) {
        studentAttendanceMap[attendance.name] = [];
      }
      DateTime attendanceDate = DateTime(
        attendance.timestamp.year,
        attendance.timestamp.month,
        attendance.timestamp.day,
      );

      if (attendanceDate.month == month &&
          attendanceDate.year == year &&
          !studentAttendanceMap[attendance.name]!.contains(attendanceDate)) {
        studentAttendanceMap[attendance.name]!.add(attendanceDate);
      }
    }

    List<DataRow> attendanceRows = studentAttendanceMap.entries.map((entry) {
      String studentName = entry.key;
      List<DateTime> attendedDates = entry.value;
      
      return DataRow(
        cells: [
          DataCell(Text(studentName)),
          ...sundays.map((sundayDate) {
            bool hasAttended = attendedDates.any(
              (attendedDate) =>
                  attendedDate.year == sundayDate.year &&
                  attendedDate.month == sundayDate.month &&
                  attendedDate.day == sundayDate.day,
            );
            return DataCell(
              Center(
                child: Icon(
                  hasAttended ? Icons.check_circle : Icons.cancel,
                  color: hasAttended ? Colors.green : Colors.red,
                ),
              ),
            );
          }),
        ],
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('출석 조회(교사)'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            context.go('/attendance');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '이름으로 검색',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchName = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        value: grades,
                        items: items.map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            grades = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        month = month - 1;
                        if (month < 1) {
                          month = 12;
                          year = year - 1;
                        }
                      });
                    },
                    child: Icon(Icons.arrow_left),
                  ),
                  Expanded(child: Center(child: Text('$year년 $month월'))),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        month = month + 1;
                        if (month > 12) {
                          month = 1;
                          year = year + 1;
                        }
                      });
                    },
                    child: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              width: double.infinity,
              child: DataTable(
                dataRowMaxHeight: 60,
                columnSpacing: 12,
                columns: [
                  DataColumn(label: Text('이름')),
                  ...sundays.map(
                    (date) =>
                        DataColumn(label: Text('${date.month}/${date.day}')),
                  ),
                ],
                rows: attendanceRows,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
