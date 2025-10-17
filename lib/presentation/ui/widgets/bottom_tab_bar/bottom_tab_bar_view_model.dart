import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomTabBarViewModel extends StateNotifier<int> {
  BottomTabBarViewModel() : super(0);
  
  void updatePage(int index) {
    state = index;
  }

  void resetPage() {
    state = 1;
  }
}

final bottomNavigationProvider =
    StateNotifierProvider<BottomTabBarViewModel, int>(
  (ref) => BottomTabBarViewModel(),
);
