import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/mangers/theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = ThemeProvider.get(context);
    return Container(
      height: 250,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if(themeProvider.isDarkThemeMode()) {
                themeProvider.changeThemeMode(ThemeMode.light);
              }
            },
            child: themeProvider.isDarkThemeMode()
                ? _unSelectedTheme(context, 'light'.tr())
                : _selectedTheme(context, 'light'.tr()),
          ),
          const SizedBox(height:20),
          InkWell(
            onTap: () {
              if(!themeProvider.isDarkThemeMode()) {
                themeProvider.changeThemeMode(ThemeMode.dark);
              }
            },
            child: themeProvider.isDarkThemeMode()
                ? _selectedTheme(context, 'dark'.tr())
                : _unSelectedTheme(context, 'dark'.tr()),
          ),

        ],
      ),
    );
  }

  Widget _selectedTheme(BuildContext context, String themeModeText) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue,width: 3)
      ),
      child: Row(
          children: [
            Text(
              themeModeText,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.blue
              ),
            ),
            const Spacer(),
            const Icon(Icons.check_circle,color: Colors.blue,size: 35,),
          ],
      ),
    );
  }

  Widget _unSelectedTheme(BuildContext context,String themeModeText) {
    return Row(
      children: [
        Text(
            themeModeText,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
             color: Theme.of(context).colorScheme.secondary
          ),
        ),
      ],
    );
  }

}
