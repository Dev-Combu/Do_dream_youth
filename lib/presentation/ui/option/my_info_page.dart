import 'package:do_dream_youth/presentation/ui/widgets/user_info/user_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInfoPage extends ConsumerStatefulWidget{
  const MyInfoPage({super.key});

  @override
  ConsumerState<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends ConsumerState<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    final userinfo = ref.watch(userInfoViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Info'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Center(
        child: Text(userinfo?.christianName ?? 'No user info'),
      ),
    );
  }
}