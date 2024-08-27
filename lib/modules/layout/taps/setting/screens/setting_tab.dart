import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/mangers/theme_provider.dart';
import 'package:todo_app/core/utils/colors_provider.dart';
import 'package:todo_app/core/widgets/app_bar_custom_widget.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';
import 'package:todo_app/modules/layout/taps/setting/screens/profile_edit_screen.dart';
import 'package:todo_app/modules/layout/taps/setting/screens/widgets/custom_drop_down_widget.dart';

import '../../../../auth/manger/auth_provider.dart'; // Assuming this exists

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = ThemeProvider.get(context);
    return Consumer2<LayoutProvider, AuthProvider>(
      builder: (context, layoutProvider, authProvider, child) {
        final double iconSize = MediaQuery.of(context).size.width * 0.1;
        final double padding = MediaQuery.of(context).size.width * 0.05;
        return Column(
          children: [
            const AppBarCustomWidget(title: 'setting'),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/account.svg',
                      color: ColorsProvider.primaly,
                      width: iconSize,
                      height: iconSize,
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    trailing: IconButton(
                      onPressed: () => Navigator.pushNamed(
                          context, ProfileEditScreen.routeName),
                      icon: SvgPicture.asset(
                        'assets/images/edit.svg',
                        color: ColorsProvider.primaly,
                        width: iconSize * 0.8,
                        height: iconSize * 0.8,
                      ),
                    ),
                    title: Text(
                      'profile'.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                    ),
                  ),
                  ListTile(
                    trailing: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        ColorsProvider.primaly,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/theme.svg',
                        width: iconSize * 0.8,
                        height: iconSize * 0.8,
                      ),
                    ),
                    title: Text(
                      'theme'.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
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
                  ListTile(
                    trailing: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        ColorsProvider.primaly,
                        BlendMode.srcIn,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/translate.svg',
                        width: iconSize * 0.8,
                        height: iconSize * 0.8,
                      ),
                    ),
                    title: Text(
                      'language'.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
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
                          onTap: () => _changeLocale(context, 'en'),
                          value: 'english',
                          child: const Text('English'),
                        ),
                        DropdownMenuItem(
                          onTap: () => _changeLocale(context, 'ar'),
                          value: 'العربية',
                          child: const Text('العربية'),
                        ),
                      ],
                      onChanged: (selectedValue) {
                        if (selectedValue == 'english') {
                          _changeLocale(context, 'en');
                        } else {
                          _changeLocale(context, 'ar');
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'logout'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorsProvider.white),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.logout,
                          color: Theme.of(context).iconTheme.color,
                          size: MediaQuery.of(context).textScaleFactor * 20,
                        ),
                      ],
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

  Future<void> _changeLocale(BuildContext context, String localeCode) async {
    final prefs = await SharedPreferences.getInstance();
    Locale newLocale = Locale(localeCode);

    await prefs.setString('locale', localeCode);
    context.setLocale(newLocale);
  }
}
