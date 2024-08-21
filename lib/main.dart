import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/mangers/theme_provider.dart';
import 'package:todo_app/core/themes/app_theme.dart';
import 'package:todo_app/modules/layout/main_layout/screens/layout_screen.dart';
import 'package:todo_app/modules/layout/taps/task_list/screens/edit_task_screen.dart';
import 'package:todo_app/modules/register/screens/register_screen.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        saveLocale: true,
        startLocale: const Locale('en'),
        child: ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: const MyApp()
        ),
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
      initialRoute: LayoutScreen.routeName,
      routes: {
        RegisterScreen.routeName: (_)=> const RegisterScreen(),
        LayoutScreen.routeName: (_)=> const LayoutScreen(),
        EditTaskScreen.routeName: (_)=> const EditTaskScreen()
      },
    );
  }
}
