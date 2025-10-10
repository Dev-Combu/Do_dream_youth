import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
class OptionPage extends StatelessWidget{
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Option'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 50,),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                )
              ],
            ),
          ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async{
              await FirebaseAuth.instance.signOut();
            },
            child: Text('로그아웃'),
          ),
        ),
      ),
    );
  }
}