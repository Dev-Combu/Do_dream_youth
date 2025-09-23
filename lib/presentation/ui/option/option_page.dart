import 'package:flutter/material.dart';

class OptionPage extends StatelessWidget{
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Option Page'),
      ),
      body: Center(
        child: Text('This is the Option Page'),
      ),
    );
  }
}