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
      appBar: AppBar(
        title: const Text('일정 상세'),
      ),
      body: Padding(
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
            const SizedBox(height: 16),
            Text(
              '설명: ${widget.description}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '시작 날짜: ${widget.startDate}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '종료 날짜: ${widget.endDate}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '대상: ${widget.target}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}