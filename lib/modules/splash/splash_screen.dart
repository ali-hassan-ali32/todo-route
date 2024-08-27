import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/get_image_path.dart';
import 'package:todo_app/modules/auth/pages/login_screen.dart';
import 'package:todo_app/modules/layout/main_layout/screens/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, LayoutScreen.routeName, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.routeName, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(getImagePath('logo.png'))));
  }
}
