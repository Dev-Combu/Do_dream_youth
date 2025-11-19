import 'package:do_dream_youth/firebase_options.dart';
import 'package:do_dream_youth/presentation/app/router.dart';
import 'package:do_dream_youth/presentation/theme/theme.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async{

  //firebase 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

await FirebaseAppCheck.instance.activate(
  androidProvider: AndroidProvider.debug, // 또는 AndroidProvider.debug
  appleProvider: AppleProvider.deviceCheck,      // iOS용
           // web에서 reCAPTCHA 쓰면 필요
);
  
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Do_Dream_Youth',
      routerConfig: router,
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'), // 한국어
      ],
      locale: const Locale('ko', 'KR'),
    );
  }
}
