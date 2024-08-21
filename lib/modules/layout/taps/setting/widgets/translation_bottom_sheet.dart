import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TranslationBottomSheet extends StatelessWidget {
  const TranslationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if(context.locale != const Locale('en')) {
                context.setLocale(const Locale('en'));
              }
            },
            child: context.locale != const Locale('en')
                ? _unSelectedTheme(context, 'English')
                : _selectedTheme(context, 'English'),
          ),
          const SizedBox(height:20),
          InkWell(
            onTap: () {
              if(context.locale != const Locale('ar')) {
                context.setLocale(const Locale('ar'));
              }
            },
            child: context.locale == const Locale('ar')
                ? _selectedTheme(context, 'العربيه')
                : _unSelectedTheme(context, 'العربيه'),
          ),

        ],
      ),
    );
  }

  Widget _selectedTheme(BuildContext context, String localeCode) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blue,width: 3)
      ),
      child: Row(
        children: [
          Text(
            localeCode,
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

  Widget _unSelectedTheme(BuildContext context,String localeCode) {
    return Row(
      children: [
        Text(
          localeCode,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.secondary
          ),
        ),
      ],
    );
  }

}
