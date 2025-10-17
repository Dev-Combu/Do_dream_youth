import 'package:do_dream_youth/presentation/ui/auth/login/login_page.dart';
import 'package:do_dream_youth/presentation/ui/auth/userInfo/sign_up_info.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up/sign_up_page.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up/sign_up_role.dart';
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
    final isLoggingIn = state.matchedLocation == '/login';
    if (user == null && !isLoggingIn) {
      return '/login';
    }
    if (user != null && isLoggingIn) {
      return '/schedule';
    }
    return null;
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
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0), // 오른쪽에서 들어오기
                        end: Offset.zero,
                      ).animate(animation),
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
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0), // 왼쪽에서
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
            );
          },
        ),
      ],
    ),
  ],
);
