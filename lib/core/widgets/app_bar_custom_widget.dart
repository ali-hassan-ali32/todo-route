import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_provider.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.arrowBack = false,
    this.isUser = false,
  });

  final String title;
  final bool arrowBack;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    // final double appBarHeight = MediaQuery.of(context).size.height * 0.24;
    // final double iconSize = MediaQuery.of(context).size.width * 0.08;
    // final double paddingHorizontal = MediaQuery.of(context).size.width * 0.05;

    return Container(
      height: 200,
      width: double.infinity,
      color: ColorsProvider.primaly,
      child: Row(
        children: [
          Visibility(
            visible: arrowBack,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, size: 25),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                isUser ? title : title.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
