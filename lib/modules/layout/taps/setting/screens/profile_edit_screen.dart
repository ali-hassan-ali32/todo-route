import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/colors_provider.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';

import '../../../../../core/widgets/app_bar_custom_widget.dart';
import '../../../../auth/pages/reset_password_screen.dart';

class ProfileEditScreen extends StatelessWidget {
  static const String routeName = 'ProfileEditScreen';

  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LayoutProvider()..getUser(),
      child: Consumer<LayoutProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  Stack(
                    children: [
                      const AppBarCustomWidget(
                        title: 'editProfileUser',
                        isThereArrowBack: true,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.2,
                        ),
                        child: Card(
                          elevation: 24,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'editProfileUser'.tr(),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  "${'name'.tr()}:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                ),
                                TextFormField(
                                  initialValue: provider.user?.name ?? '',
                                  onChanged: provider.setName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w400,
                                      ),
                                  decoration: InputDecoration(
                                    hintText: 'enterYourName'.tr(),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width,
                                        50), // Responsive button size
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, ResetPasswordScreen.routeName);
                                  },
                                  child: Text(
                                    'resetPassword'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: ColorsProvider.white),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width,
                                        50), // Responsive button size
                                  ),
                                  onPressed: () {
                                    provider
                                        .updateUser(); // Update the user profile
                                  },
                                  child: Text(
                                    'saveChanges'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: ColorsProvider.white),
                                  ),
                                ),
                                const SizedBox(height: 55),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
