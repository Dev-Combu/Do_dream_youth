import 'package:do_dream_youth/presentation/ui/widgets/user_info/user_info_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyInfoPage extends ConsumerStatefulWidget{
  const MyInfoPage({super.key});

  @override
  ConsumerState<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends ConsumerState<MyInfoPage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userinfo = ref.watch(userInfoViewModelProvider).value;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go('/option');
          },
        ),
        centerTitle: true,
        title: Text('My Info'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text('로그인 정보'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("이메일", style: TextStyle(fontSize: 20),),
                        Text('email@email.com',  style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}