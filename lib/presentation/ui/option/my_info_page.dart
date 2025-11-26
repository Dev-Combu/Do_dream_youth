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
      body: Center(
        child: Column(
          children: [
            Text(userinfo?.christianName ?? 'No user info'),
            Text(user!.uid),
          ],
        ),
      ),
    );
  }
}