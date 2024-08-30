import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/servises/firebase_function/firebase_functions.dart';
import 'package:todo_app/modules/auth/pages/login_screen.dart';
import 'package:todo_app/modules/layout/main_layout/screens/layout_screen.dart';

class AuthProvider extends ChangeNotifier {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  bool isSecure = true;

  void changeSecured() {
    isSecure = !isSecure;
    notifyListeners();
  }

  void createUserAccount(BuildContext context) async {
    await FirebaseFunctions.createUserAccount(emailController.text,
            passwordController.text, nameController.text, phoneController.text)
        .then(
      (value) {
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        phoneController.clear();
        Navigator.pushNamedAndRemoveUntil(
            context, LayoutScreen.routeName, (route) => false);
      },
    );
  }

  void logoutUser(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.routeName, (route) => false);
  }

  void loginUser(BuildContext context) async {
    try {
      final UserCredential credential = await FirebaseFunctions.loginUser(
          emailController.text, passwordController.text);
      if (credential.user != null) {
        emailController.clear();
        passwordController.clear();
        const snackBar = SnackBar(
          content: Text('Welcome'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushNamedAndRemoveUntil(
            context, LayoutScreen.routeName, (route) => false);
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Email or Password not Correct'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void resetPassword(BuildContext context, String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Navigator.pop(context);
  }
}
