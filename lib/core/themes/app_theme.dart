import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 35
    ),
    splashColor: Colors.blue,
    bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white
      ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff5D9CEC),
        primary: const Color(0xff5D9CEC),
        onPrimary: Colors.grey,
        tertiary: Colors.white,
        secondary: Colors.black
      ),
    scaffoldBackgroundColor: const Color(0xffDFECDB),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 33,
          fontFamily: 'poppins',
          color: Colors.white,
        ),
        titleMedium: TextStyle(
              fontSize: 22, fontFamily: 'poppins', color: Colors.white),
        bodySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        bodyMedium: TextStyle(
            fontFamily: 'poppins', fontSize: 18, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 50,
        )),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 200,
      color: Color(0xff5D9CEC),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 35,
      )
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            size: 35,
          ),
          unselectedIconTheme: IconThemeData(size: 35)),
    cardColor: Colors.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff5D9CEC),
      shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3)),
    ));

  static ThemeData dark = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xff141922)
    ),
    splashColor: Colors.blue,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff5D9CEC),
      primary: const Color(0xff5D9CEC),
      onPrimary: Colors.white,
      tertiary: const Color(0xff141922),
      secondary: Colors.white
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff141922)),
    scaffoldBackgroundColor: const Color(0xff1E1E1E),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 33,
          fontFamily: 'poppins',
          color: Colors.black,
        ),
          titleMedium: TextStyle(
              fontSize: 22, fontFamily: 'poppins', color: Colors.black),
          bodySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          bodyMedium: TextStyle(
              fontFamily: 'poppins',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 50,
          )),
    appBarTheme: const AppBarTheme(color: Color(0xff5D9CEC)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            size: 35,
          ),
          unselectedIconTheme: IconThemeData(size: 35)),
    cardColor: const Color(0xff141922),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff5D9CEC),
        shape:
            StadiumBorder(side: BorderSide(color: Color(0xff141922), width: 3)),
      ));
}
