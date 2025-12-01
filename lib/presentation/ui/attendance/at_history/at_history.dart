import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AtHistory extends StatefulWidget{
  const AtHistory({super.key});

  @override
  State<AtHistory> createState() => _AtHistoryState();
}

class _AtHistoryState extends State<AtHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go('/attendance');
          },
        ),
        title: Text('출석 내역'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  '날짜',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '출석 상태',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '출석 상태',
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
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2024-06-01')),
                  DataCell(Text('출석')),
                  DataCell(Text('출석')),
                  DataCell(Text('출석')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2024-06-02')),
                  DataCell(Text('출석')),
                  DataCell(Text('출석')),
                  DataCell(Text('지각')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2024-06-03')),
                  DataCell(Text('출석')),
                  DataCell(Text('출석')),
                  DataCell(Text('결석')),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}