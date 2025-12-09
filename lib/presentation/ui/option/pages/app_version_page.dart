import 'package:flutter/material.dart';

class AppVersionPage extends StatelessWidget{
  const AppVersionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('App Version'),
      ),
      body: Center(
        child: Text('App Version 1.0.0'),
      ),
    );
  }
}