import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(255, 206, 246, 248),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blue, // 바텀 내비게이션 바의 배경색
      selectedItemColor: Colors.white, // 선택된 아이템의 색상
      unselectedItemColor: Colors.white70, // 선택되지 않은 아이템의 색상
      selectedIconTheme: const IconThemeData(size: 30), // 선택된 아이콘 크기
      unselectedIconTheme: const IconThemeData(size: 24), // 선택되지 않은 아이콘 크기
      showSelectedLabels: true, // 선택된 아이템 라벨 표시
      showUnselectedLabels: false, // 선택되지 않은 아이템 라벨 표시
      type: BottomNavigationBarType.fixed, // 아이템 개수에 따른 타입 (fixed, shifting)
    ),
    fontFamily: 'Pretendard',
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
      ),
      displayLarge: TextStyle(fontFamily: 'Pretendard', fontSize: 57.0),
      displayMedium: TextStyle(fontFamily: 'Pretendard', fontSize: 45.0),
      bodyLarge: TextStyle(fontFamily: 'Pretendard', fontSize: 16.0),
      bodyMedium: TextStyle(fontFamily: 'Pretendard', fontSize: 14.0),
      bodySmall: TextStyle(fontFamily: 'Pretendard', fontSize: 12.0),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: 'Pretendard',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: Colors.blue,
    ),
  );
}
