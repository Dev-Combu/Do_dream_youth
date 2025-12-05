import 'package:flutter/material.dart';

class SchdeuleDetailPage extends StatefulWidget {
  const SchdeuleDetailPage({
    super.key,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.target,
  });
  final String name;
  final String description;
  final String startDate;
  final String endDate;
  final String target;

  @override
  State<SchdeuleDetailPage> createState() => _SchdeuleDetailPageState();
}

class _SchdeuleDetailPageState extends State<SchdeuleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(backgroundColor: Colors.blue, title: const Text('일정 상세')),
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
                  widget.name ?? '일정 이름 없음',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Text(
                      '기간: ${widget.startDate} ~ ${widget.endDate}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Spacer(),
                    Text(
                      '대상: ${widget.target}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Divider(height: 32, color: Colors.grey),
                Text(
                  '설명: ${widget.description}',
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
