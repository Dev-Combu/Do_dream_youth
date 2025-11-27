import 'package:do_dream_youth/firebase_options.dart';
import 'package:do_dream_youth/presentation/app/router.dart';
import 'package:do_dream_youth/presentation/theme/theme.dart';
import 'package:do_dream_youth/presentation/ui/widgets/user_info/user_info_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  //firebase 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoAsync = ref.watch(userInfoViewModelProvider);

    return userInfoAsync.when(
      // A. 로딩 중일 때: 스플래시 또는 로딩 화면 표시
      loading: () {
        return MaterialApp(
          home: Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      },
      data: (userInfo) {
        // B. 데이터가 로드되었을 때: 메인 애플리케이션 표시
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
      },
      error: (err, stack) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text(
                '앱 초기화 오류: ${err.toString()}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        );
      },
    );
  }
}
