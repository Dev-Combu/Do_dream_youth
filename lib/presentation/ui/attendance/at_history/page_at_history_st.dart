import 'dart:math';

import 'package:do_dream_youth/presentation/ui/attendance/at_history/at_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class PageAtHistorySt extends ConsumerStatefulWidget {
  const PageAtHistorySt({super.key});

  @override
  ConsumerState<PageAtHistorySt> createState() => _PageAtHistoryStState();
}

class _PageAtHistoryStState extends ConsumerState<PageAtHistorySt> {
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  Logger log = Logger();

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
    print(  'attendances: ${attendances.length}');

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
    final int attendedCount = sundays.where((date) => atOrNot(date)).length;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go('/attendance');
          },
        ),
        title: Text('출석 조회'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                        if(month <1){
                          month = 12;
                          year = year -1;
                        }
                      });
                    },
                    child: Icon(Icons.arrow_left),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '$year년 $month월',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        month = month + 1;
                        if(month >12){
                          month = 1;
                          year = year +1;
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
                color: Colors.blue[300],
              ),
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('미사 일수', style: TextStyle(color: Colors.white),),
                        Text(
                          '${sundays.length}일',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('출석 일수', style: TextStyle(color: Colors.white),),
                        Text(
                          '$attendedCount일',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white
              ),
              width: double.infinity,
              child: DataTable(
                dataRowMaxHeight : 100,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      '날짜',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '요일',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '출석 상태',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: sundays
                    .map(
                      (date) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text('${date.month}/${date.day}')),
                          DataCell(Text('일요일')),
                          DataCell(Text(atOrNot(date) ? '출석' : '결석')), // 출석 상태는 예시로 '출석'으로 고정
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
