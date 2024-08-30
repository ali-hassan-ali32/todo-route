import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/colors_provider.dart';
import 'package:todo_app/modules/auth/manger/auth_provider.dart';
import 'package:todo_app/modules/auth/pages/login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  static const routeName = 'CreateAccountScreen';

  CreateAccountScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) => Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    'createAccount'.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      color: ColorsProvider.primaly,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'invaildName'.tr();
                      } else {
                        return null;
                      }
                    },
                    controller: provider.nameController,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(hintText: 'name'.tr()),
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'invalidEmail'.tr();
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return 'emailNotCorrect'.tr();
                      } else {
                        return null;
                      }
                    },
                    controller: provider.emailController,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(hintText: 'email'.tr()),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(height: size.height * 0.01),
                  TextFormField(
                    controller: provider.passwordController,
                    obscureText: provider.isSecure,
                    obscuringCharacter: '*',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      hintText: 'password'.tr(),
                      suffixIcon: IconButton(
                        onPressed: () => provider.changeSecured(),
                        icon: provider.isSecure
                            ? const Icon(Icons.visibility_off,
                                color: ColorsProvider.unSeclectedItem)
                            : const Icon(Icons.visibility,
                                color: ColorsProvider.primaly),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.createUserAccount(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsProvider.primaly,
                      foregroundColor: ColorsProvider.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      fixedSize: Size.fromHeight(size.height * 0.06),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'createAccount'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorsProvider.white),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.routeName, (route) => false),
                    child: Text(
                      'alreadyHaveAccount'.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
