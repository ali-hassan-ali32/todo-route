import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/mangers/theme_provider.dart';
import 'package:todo_app/core/utils/colors_provider.dart';
import 'package:todo_app/core/widgets/app_bar_custom_widget.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';
import 'package:todo_app/modules/layout/taps/setting/screens/widgets/custom_drop_down_widget.dart';

import '../../../../auth/manger/auth_provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  Future<void> changeLanauge(BuildContext context, String localeCode) async {
    final prefs = await SharedPreferences.getInstance();
    Locale newLocale = Locale(localeCode);

    await prefs.setString('locale', localeCode);
    context.setLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = ThemeProvider.get(context);
    return Consumer2<LayoutProvider, AuthProvider>(
      builder: (context, provider, authProvider, child) {
        return Column(
          children: [
            const AppBarWidget(title: 'setting'),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'theme'.tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                  ),
                  const SizedBox(height: 10),
                  CustomDropDownWidget(
                      context: context,
                      value: themeProvider.themeDropDownValue,
                      items: [
                        DropdownMenuItem(
                          onTap: () =>
                              themeProvider.changeThemeMode(ThemeMode.light),
                          value: 'light',
                          child: Text('light'.tr()),
                        ),
                        DropdownMenuItem(
                          onTap: () =>
                              themeProvider.changeThemeMode(ThemeMode.dark),
                          value: 'dark',
                          child: Text('dark'.tr()),
                        ),
                      ],
                      onChanged: themeProvider.onThemeDropDownClick),
                  const SizedBox(height: 20),
                  Text(
                    'language'.tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                  ),
                  const SizedBox(height: 10),
                  CustomDropDownWidget(
                      context: context,
                      value: context.locale.languageCode == 'en'
                          ? 'english'
                          : 'العربية',
                      items: [
                        DropdownMenuItem(
                          onTap: () => changeLanauge(context, 'en'),
                          value: 'english',
                          child: const Text('English'),
                        ),
                        DropdownMenuItem(
                          onTap: () => changeLanauge(context, 'ar'),
                          value: 'العربية',
                          child: const Text('العربية'),
                        ),
                      ],
                      onChanged: (selectedValue) {
                        if (selectedValue == 'english') {
                          changeLanauge(context, 'en');
                        } else {
                          changeLanauge(context, 'ar');
                        }
                      }),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () => authProvider.logoutUser(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    child: Text(
                      'logout'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorsProvider.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
