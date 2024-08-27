import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/colors_provider.dart';
import 'package:todo_app/modules/auth/manger/auth_provider.dart';
import 'package:todo_app/modules/auth/pages/create_account_screen.dart';
import 'package:todo_app/modules/auth/pages/reset_password_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Text(
                  'login'.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorsProvider.primaly,
                        fontSize: size.width * 0.07,
                      ),
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  controller: provider.emailController,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(hintText: 'email'.tr()),
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  obscuringCharacter: '*',
                  obscureText: provider.isSecure,
                  controller: provider.passwordController,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    hintText: 'password'.tr(),
                    suffixIcon: IconButton(
                      onPressed: () => provider.changeSecured(),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: provider.isSecure
                          ? const Icon(Icons.visibility_off,
                              color: ColorsProvider.unSeclectedItem)
                          : const Icon(Icons.visibility,
                              color: ColorsProvider.primaly),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                ElevatedButton(
                  onPressed: () => provider.loginUser(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsProvider.primaly,
                    foregroundColor: ColorsProvider.white,
                    minimumSize: Size.fromHeight(size.height * 0.07),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'login'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: ColorsProvider.white),
                      ),
                      Icon(
                        Icons.login,
                        color: Theme.of(context).iconTheme.color,
                        size: size.width * 0.06,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () {
                    Navigator.pushNamed(context, ResetPasswordScreen.routeName);
                  },
                  child: Center(
                    child: Text(
                      'dontRememberPassword'.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () {
                    Navigator.pushNamed(context, CreateAccountScreen.routeName);
                  },
                  child: Center(
                    child: Text(
                      'dontHaveAccount'.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
