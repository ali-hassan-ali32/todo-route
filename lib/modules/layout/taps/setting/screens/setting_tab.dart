import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/mangers/theme_provider.dart';
import 'package:todo_app/core/widgets/app_bar_custom_widget.dart';
import 'package:todo_app/modules/layout/taps/setting/widgets/theme_bottom_sheet.dart';
import 'package:todo_app/modules/layout/taps/setting/widgets/translation_bottom_sheet.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = ThemeProvider.get(context);
    return Column(
      children: [
        const AppBarCustomWidget(title: 'Setting'),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('theme'.tr()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                child: InkWell(
                  onTap: () {
                    _showThemeBottomSheet(context);
                  },
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      border: Border.all(color: Colors.blue, width: 3),
                    ),
                    child: Row(
                      children: [
                        Text(themeProvider.currentThemeMode == ThemeMode.light
                            ? 'light'.tr()
                            : "dark".tr(),
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {},icon: const Icon(Icons.keyboard_arrow_down,color: Colors.blue,))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Text('language'.tr()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                child: InkWell(
                  onTap: () {
                    _showTransalationBottomSheet(context);
                  },
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      border: Border.all(color: Colors.blue, width: 3),
                    ),
                    child: Row(
                      children: [
                        Text(context.locale == const Locale('en')
                            ? 'English'
                            : 'العربيه',
                        ),
                        const Spacer(),
                        IconButton(onPressed: () {},icon: const Icon(Icons.keyboard_arrow_down,color: Colors.blue,))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder:(_) {
      return const ThemeBottomSheet();
    },);
  }
  void _showTransalationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder:(_) {
        return const TranslationBottomSheet();
      },);
  }
}
