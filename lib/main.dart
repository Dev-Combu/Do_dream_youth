import 'package:do_dream_youth/firebase_options.dart';
import 'package:do_dream_youth/presentation/app/router.dart';
import 'package:do_dream_youth/presentation/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{

    // .env로드 및 firebase 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Record Reading',
      routerConfig: router,
      theme: AppTheme.lightTheme,
    );
  }
}
