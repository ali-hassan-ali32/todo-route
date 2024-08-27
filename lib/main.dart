import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/mangers/theme_provider.dart';
import 'package:todo_app/core/themes/app_theme.dart';
import 'package:todo_app/modules/auth/pages/create_account_screen.dart';
import 'package:todo_app/modules/auth/pages/login_screen.dart';
import 'package:todo_app/modules/auth/pages/reset_password_screen.dart';
import 'package:todo_app/modules/layout/main_layout/screens/layout_screen.dart';
import 'package:todo_app/modules/layout/taps/setting/screens/profile_edit_screen.dart';
import 'package:todo_app/modules/layout/taps/task_list/screens/edit_task_screen.dart';
import 'package:todo_app/modules/splash/splash_screen.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String? savedLocaleCode = prefs.getString('locale');
  Locale initialLocale =
      savedLocaleCode == null ? const Locale('en') : Locale(savedLocaleCode);
  runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        saveLocale: true,
    startLocale: initialLocale,
    child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(prefs: prefs), child: const MyApp()),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = ThemeProvider.get(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeProvider.currentThemeMode,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        CreateAccountScreen.routeName: (_) => CreateAccountScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        ProfileEditScreen.routeName: (_) => const ProfileEditScreen(),
        LayoutScreen.routeName: (_)=> const LayoutScreen(),
        ResetPasswordScreen.routeName: (_) => ResetPasswordScreen(),
        EditTaskScreen.routeName: (_)=> const EditTaskScreen()
      },
    );
  }
}
