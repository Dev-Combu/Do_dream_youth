import 'package:do_dream_youth/presentation/ui/attendance/at_history/at_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PageAtHistoryTeacher extends ConsumerStatefulWidget {
  const PageAtHistoryTeacher({super.key});

  @override
  ConsumerState<PageAtHistoryTeacher> createState() =>
      _PageAtHistoryTeacherState();
}

class _PageAtHistoryTeacherState extends ConsumerState<PageAtHistoryTeacher> {
  int month = DateTime.now().month;
  int year = DateTime.now().year;

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

  bool atOrNot(DateTime date) {
    final attendances = ref.read(atHistoryViewModel).atHistoryList;
    print('attendances: ${attendances.length}');

    for (var attendance in attendances) {
      if (attendance.timestamp.year == date.year &&
          attendance.timestamp.month == date.month &&
          attendance.timestamp.day == date.day) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final List<DateTime> sundays = getSundaysInMonth(year, month);
    final atAll = ref.watch(atHistoryViewModel).atHistoryList;

    // 1. 학생별 출석 날짜를 그룹화하는 Map 생성
  Map<String, List<DateTime>> studentAttendanceMap = {};
  for (var attendance in atAll) {
    if (!studentAttendanceMap.containsKey(attendance.name)) {
      studentAttendanceMap[attendance.name] = [];
    }
    // 해당 월의 출석만 표시되므로, 날짜가 중복되지 않도록 확인 후 추가
    DateTime attendanceDate = DateTime(
        attendance.timestamp.year,
        attendance.timestamp.month,
        attendance.timestamp.day);

    if (attendanceDate.month == month &&
        attendanceDate.year == year &&
        !studentAttendanceMap[attendance.name]!.contains(attendanceDate)) {
      studentAttendanceMap[attendance.name]!.add(attendanceDate);
    }
  }

  // 2. Map을 사용하여 DataRow 리스트 생성
  List<DataRow> attendanceRows = studentAttendanceMap.entries.map((entry) {
    String studentName = entry.key;
    List<DateTime> attendedDates = entry.value;

    return DataRow(
      cells: [
        // 첫 번째 Cell: 학생 이름
        DataCell(Text(studentName)),

        // 나머지 Cell: 일요일별 출석 여부
        ...sundays.map(
          (sundayDate) {
            // 해당 일요일에 이 학생의 출석 기록이 있는지 확인
            bool hasAttended = attendedDates.any(
              (attendedDate) =>
                  attendedDate.year == sundayDate.year &&
                  attendedDate.month == sundayDate.month &&
                  attendedDate.day == sundayDate.day,
            );

            return DataCell(
              Center( // 중앙 정렬을 위해 Center 추가 (선택 사항)
                child: Icon(
                  hasAttended ? Icons.check_circle : Icons.cancel,
                  color: hasAttended ? Colors.green : Colors.red,
                ),
              ),
            );
          },
        ),
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
            TextField(
              decoration: InputDecoration(
                labelText: '학생 이름으로 검색',
                border: OutlineInputBorder(),
              ),
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
                rows:attendanceRows
              ),
            ),
          ],
        ),
      ),
    );
  }
}
