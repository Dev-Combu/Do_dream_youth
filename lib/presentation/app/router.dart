import 'package:do_dream_youth/presentation/ui/auth/login/login_page.dart';
import 'package:do_dream_youth/presentation/ui/auth/userInfo/sign_up_info.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up/sign_up_page.dart';
import 'package:do_dream_youth/presentation/ui/auth/sign_up/sign_up_role.dart';
import 'package:do_dream_youth/presentation/ui/option/option_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigatorKey,
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
    GoRoute(path:'/options', builder: (context, state) => OptionPage(),)
  ],
);
