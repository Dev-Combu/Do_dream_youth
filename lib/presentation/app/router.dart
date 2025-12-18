import 'package:do_dream_youth/presentation/ui/attendance/at_history/page_at_history_st.dart';
import 'package:do_dream_youth/presentation/ui/attendance/at_history/page_at_history_teacher.dart';
import 'package:do_dream_youth/presentation/ui/attendance/attendance_chek/attendance_check_page.dart';
import 'package:do_dream_youth/presentation/ui/attendance/attendance_page.dart';
import 'package:do_dream_youth/presentation/ui/attendance/attendance_qr/attendance_qr_page.dart';
import 'package:do_dream_youth/presentation/ui/auth/login/login_page.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up_info/sign_up_info.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up/sign_up_page.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up/sign_up_role.dart';
import 'package:do_dream_youth/presentation/ui/option/pages/my_info_page.dart';
import 'package:do_dream_youth/presentation/ui/option/option_page.dart';
import 'package:do_dream_youth/presentation/ui/schedule/schedule_page.dart';
import 'package:do_dream_youth/presentation/ui/widgets/bottom_tab_bar/bottom_tab_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    stream.listen((_) => notifyListeners());
  }
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigatorKey,

  refreshListenable: GoRouterRefreshStream(
    FirebaseAuth.instance.authStateChanges(),
  ),
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final bool isLoggingInPath = state.matchedLocation == '/login';
    final bool isSignUpRolePath = state.matchedLocation == '/signuprole';
    final bool isSignUpPath = state.matchedLocation == '/signup';
    final bool isSignUpInfoPath = state.matchedLocation == '/signupInfo';
    final bool isPublicPath = isLoggingInPath || isSignUpRolePath || isSignUpPath || isSignUpInfoPath;
        // 1. 사용자가 로그인되어 있지 않을 때 (user == null)
    if (user == null) {
      // public 경로가 아닌 다른 경로로 접근하려 하면 -> /login으로 리다이렉트
      if (!isPublicPath) {
        return '/login';
      }
      // public 경로이면 그대로 진행 (로그인 또는 회원가입 페이지로)
      return null;
    }

    // 2. 사용자가 로그인되어 있을 때 (user != null)
    else {
      // 로그인 또는 회원가입 페이지로 접근하려 하면 -> /schedule로 리다이렉트
      if (isPublicPath) {
        return '/schedule';
      }
      // 그 외의 경우는 그대로 진행
      return null;
    }
  },
  routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: '/signuprole', builder: (context, state) => SignUpRole()),
    GoRoute(
      path: '/signup',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        return SignUpPage(role: args['role']);
      },
    ),
    GoRoute(
      path: '/singupInfo',
      builder: (context, state) {
        final args = state.extra as Map<String, dynamic>;
        return SignUpInfo(role: args['role']);
      },
    ),

    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) {
        return Scaffold(
          body: child, // 현재 선택된 페이지가 child로 들어옴
          bottomNavigationBar: BottomTabBar(), // 고정된 네비게이션 바
        );
      },
      routes: [
        GoRoute(
          path: '/schedule',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const SchedulePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation, // 0.0에서 1.0으로 서서히 나타남
                      child: child,
                    );
                  },
            );
          },
        ),
        GoRoute(
          path: '/attendance',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const AttendancePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation, // 0.0에서 1.0으로 서서히 나타남
                      child: child,
                    );
                  },
            );
          },
        ),
        GoRoute(
          path: '/option',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const OptionPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation, // 0.0에서 1.0으로 서서히 나타남
                      child: child,
                    );
                  },
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/at_history_st',
      builder: (context, state) => PageAtHistorySt(),
    ),
    GoRoute(
      path: '/at_history_teacher',
      builder: (context, state) => PageAtHistoryTeacher(),
    ),
    GoRoute(
      path: '/attendance_qr',
      builder: (context, state) => AttendanceQrPage(),
    ),
    GoRoute(
      path: '/attendance_check',
      builder: (context, state) => AttendanceCheckPage(),
    ),
    GoRoute(
      path: '/my_info',
      builder: (context, state) => MyInfoPage(),
    ),
  ],
);
