import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'RegisterScreen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),
              const Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 55,
                    color: Colors.white
                  ),
                ),
              ),
              CustomTextField(title: 'full name', hint: 'pleas enter full name'),
              CustomTextField(title: 'email', hint: 'pleas enter email',keyboardType: TextInputType.emailAddress,),
              CustomTextField(title: 'password', hint: 'pleas enter password',keyboardType: TextInputType.visiblePassword, securedPassword: true),
              CustomTextField(title: 'confirm password', hint: 'pleas confirm password',keyboardType: TextInputType.visiblePassword, securedPassword: true,),

            ],
          ),
        ),
      ),
    );
  }
}
