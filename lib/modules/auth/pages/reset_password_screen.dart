import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/colors_provider.dart';
import 'package:todo_app/modules/auth/manger/auth_provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = 'ResetPasswordScreen';

  ResetPasswordScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: ColorsProvider.primaly),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Consumer<AuthProvider>(
            builder: (context, provider, child) => Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  Center(
                    child: Text(
                      'resetPassword'.tr(),
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        color: ColorsProvider.primaly,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    "${'enterYourEmail'.tr()}:",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: size.width * 0.045,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextFormField(
                    controller: provider.passwordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'invaildEmail'.tr();
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return 'emailNotCorrect'.tr();
                      } else {
                        return null;
                      }
                    },
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(hintText: 'email'.tr()),
                  ),
                  SizedBox(height: size.height * 0.05),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.resetPassword(
                            context, provider.emailController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsProvider.primaly,
                      foregroundColor: ColorsProvider.white,
                      fixedSize: Size.fromHeight(size.height * 0.06),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'resetPassword'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorsProvider.white),
                        ),
                        const Icon(Icons.password),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
