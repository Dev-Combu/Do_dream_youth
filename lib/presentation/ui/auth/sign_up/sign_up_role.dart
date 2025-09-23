import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum UserRole { student, teacher }

class SignUpRole extends StatelessWidget{
  const SignUpRole({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("역할 선택"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                      context.go('/signup', extra: {'role': 'teacher'});
                    },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 93, 114, 131)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: 150,
                      height: 150,
                      child: Text("교사"),  
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                      context.go('/signup', extra: {'role': 'student'});
                    },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: 150,
                      height: 150,
                      child: Text("학생"),  
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}