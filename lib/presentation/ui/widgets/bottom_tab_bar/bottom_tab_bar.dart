import 'package:do_dream_youth/presentation/ui/widgets/bottom_tab_bar/bottom_tab_bar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 상수 선언으로 가독성 향상

const int schedule = 0;
const int option = 1;

class BottomTabBar extends ConsumerStatefulWidget {
  const BottomTabBar({super.key});

  @override
  ConsumerState<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends ConsumerState<BottomTabBar> {

  void _handleNavigation(BuildContext context, WidgetRef ref, int value) {
    final currentPage = ref.watch(bottomNavigationProvider);

    final routes = ['/schedule','/option'];
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
      icon: Icon(icon, color: isSelected ? Colors.black : Colors.grey),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentPage = ref.watch(bottomNavigationProvider);
        return BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) => _handleNavigation(context, ref, value),
          items: [
            _buildNavItem(
                icon: Icons.book, label: 'Schedule', isSelected: currentPage == schedule),
            _buildNavItem(
                icon: Icons.home, label: 'Option', isSelected: currentPage == option),
          ],
        );
      },
    );
  }
}
