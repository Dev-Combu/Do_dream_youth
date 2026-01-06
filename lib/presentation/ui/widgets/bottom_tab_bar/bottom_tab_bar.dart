import 'package:do_dream_youth/presentation/config/user_info/user_info_view_model.dart';
import 'package:do_dream_youth/presentation/ui/widgets/bottom_tab_bar/bottom_tab_bar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 상수 선언으로 가독성 향상

const int schedule = 0;
const int attendance = 1;
const int option = 2;

class BottomTabBar extends ConsumerStatefulWidget {
  const BottomTabBar({super.key});

  @override
  ConsumerState<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends ConsumerState<BottomTabBar> {
  void _handleNavigation(BuildContext context, WidgetRef ref, int value) {
    final currentPage = ref.watch(bottomNavigationProvider);

    final routes = ['/schedule', '/attendance', '/option'];
    if (currentPage != value) {
      context.go(routes[value]);
      ref.read(bottomNavigationProvider.notifier).updatePage(value);
    }
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: isSelected ? Colors.black : Colors.white),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentPage = ref.watch(bottomNavigationProvider);
        final userRole = ref
            .watch(userInfoViewModelProvider)
            .value
            ?.role; // read 대신 watch 권장

        // 1. 역할에 따른 탭 구성 정의
        final List<Map<String, dynamic>> tabs = [
          {'id': schedule, 'icon': Icons.calendar_month, 'label': 'Schedule'},
          if (userRole != 'guest')
            {'id': attendance, 'icon': Icons.fact_check, 'label': 'Attendance'},
          {'id': option, 'icon': Icons.home, 'label': 'Option'},
        ];

        // 2. 현재 선택된 id가 이 리스트의 몇 번째 인덱스인지 계산
        int currentIndex = tabs.indexWhere((tab) => tab['id'] == currentPage);
        if (currentIndex == -1) currentIndex = 0; // 예외 처리

        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            // 클릭한 실제 탭의 id(0, 1, 2)를 가져와 이동
            final selectedId = tabs[index]['id'] as int;
            _handleNavigation(context, ref, selectedId);
          },
          items: tabs
              .map(
                (tab) => _buildNavItem(
                  icon: tab['icon'],
                  label: tab['label'],
                  isSelected: currentPage == tab['id'],
                ),
              )
              .toList(),
        );
      },
    );
  }
}
