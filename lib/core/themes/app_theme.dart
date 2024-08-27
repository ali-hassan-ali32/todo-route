import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_provider.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    iconTheme: const IconThemeData(
        color: ColorsProvider.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: ColorsProvider.primaly,
        foregroundColor: ColorsProvider.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        fixedSize: const Size(double.infinity, 50),
      )),
      splashColor: ColorsProvider.primaly,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorsProvider.white,
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsProvider.primaly,
          primary: ColorsProvider.primaly,
          onPrimary: ColorsProvider.darkTitleTextColor,
          tertiary: ColorsProvider.lightWatchIcon,
          onTertiary: ColorsProvider.white,
          secondary: ColorsProvider.unSeclectedItem,
          onSecondary: ColorsProvider.white),
      scaffoldBackgroundColor: ColorsProvider.lightScafold,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24, // Matching size with dark mode
            fontWeight: FontWeight.w700,
            fontFamily: 'poppins',
            color: ColorsProvider.darkTitleTextColor,
          ),
          bodySmall: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14, // Matching size with dark mode
              color: ColorsProvider.lightTextColor),
          bodyMedium: TextStyle(
              fontFamily: 'poppins',
              fontSize: 16, // Matching size with dark mode
              fontWeight: FontWeight.w700,
              color: ColorsProvider.darkTitleTextColor),
          bodyLarge: TextStyle(
            fontSize: 20, // Matching size with dark mode
            fontWeight: FontWeight.w700,
            color: ColorsProvider.darkTitleTextColor,
          )),
      appBarTheme: const AppBarTheme(
          color: ColorsProvider.primaly,
          iconTheme: IconThemeData(
            color: ColorsProvider.white,
          )),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: ColorsProvider.lightEmtpyInputColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff707070),
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff707070),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff707070),
          ),
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: ColorsProvider.white),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: ColorsProvider.primaly,
          unselectedItemColor: ColorsProvider.unSeclectedItem,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
              size: 24, // Matching size with dark mode
              color: ColorsProvider.primaly),
          unselectedIconTheme: IconThemeData(
            size: 20, // Matching size with dark mode
            color: ColorsProvider.unSeclectedItem,
          )),
      cardColor: ColorsProvider.white,
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        headerBackgroundColor: Colors.blue,
        headerForegroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        dayForegroundColor: MaterialStateProperty.all(Colors.black),
        dayOverlayColor:
            MaterialStateProperty.all(Colors.blue.withOpacity(0.2)),
        dayBackgroundColor: MaterialStateProperty.all(Colors.transparent),
        todayForegroundColor: MaterialStateProperty.all(Colors.blue),
        todayBackgroundColor:
            MaterialStateProperty.all(Colors.blue.withOpacity(0.2)),
        todayBorder: const BorderSide(
          color: Colors.blue,
          width: 1,
        ),
        yearForegroundColor: MaterialStateProperty.all(Colors.black),
        yearOverlayColor:
            MaterialStateProperty.all(Colors.blue.withOpacity(0.2)),
        yearBackgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsProvider.primaly,
        shape: StadiumBorder(
            side: BorderSide(color: ColorsProvider.white, width: 3)),
      ));

  static ThemeData dark = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsProvider.darkPrimaly,
          primary: ColorsProvider.primaly,
          onPrimary: ColorsProvider.darkPrimaly,
          tertiary: ColorsProvider.white,
          onTertiary: ColorsProvider.white,
          secondary: ColorsProvider.unSeclectedItem,
          onSecondary: ColorsProvider.white,
          primaryContainer: ColorsProvider.darkPrimaly),
      iconTheme: const IconThemeData(color: ColorsProvider.white, size: 24),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: ColorsProvider.unSeclectedItem,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff707070),
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff707070),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff707070),
          ),
        ),
      ),
      datePickerTheme: const DatePickerThemeData(
          backgroundColor: ColorsProvider.darkPrimaly,
          dividerColor: ColorsProvider.primaly,
          headerBackgroundColor: ColorsProvider.primaly,
          headerForegroundColor: Colors.white,
          dayForegroundColor: MaterialStatePropertyAll(ColorsProvider.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
      splashColor: ColorsProvider.primaly,
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(ColorsProvider.primaly))),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorsProvider.darkPrimaly,
        elevation: 0,
      ),
      scaffoldBackgroundColor: ColorsProvider.darkScafold,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'poppins',
            color: ColorsProvider.darkTitleTextColor,
          ),
          bodySmall: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
          bodyMedium: TextStyle(
              fontFamily: 'poppins',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          )),
      appBarTheme: const AppBarTheme(
          color: ColorsProvider.primaly,
          iconTheme: IconThemeData(
            color: ColorsProvider.white,
          )),
      bottomAppBarTheme:
          const BottomAppBarTheme(color: ColorsProvider.darkPrimaly),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: ColorsProvider.primaly,
          unselectedItemColor: ColorsProvider.unSeclectedItem,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme:
              IconThemeData(size: 24, color: ColorsProvider.primaly),
          unselectedIconTheme: IconThemeData(
            size: 20,
            color: ColorsProvider.unSeclectedItem,
          )),
      cardColor: ColorsProvider.darkPrimaly,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsProvider.primaly,
        shape: StadiumBorder(
            side: BorderSide(color: ColorsProvider.darkPrimaly, width: 4)),
      ));
}
