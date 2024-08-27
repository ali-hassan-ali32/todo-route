import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_provider.dart';

class AppBarCustomWidget extends StatelessWidget {
  const AppBarCustomWidget({
    super.key,
    required this.title,
    this.isThereArrowBack = false,
    this.isUserName = false,
  });

  final String title;
  final bool isThereArrowBack;
  final bool isUserName;

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = MediaQuery.of(context).size.height * 0.24;
    final double iconSize = MediaQuery.of(context).size.width * 0.08;
    final double paddingHorizontal = MediaQuery.of(context).size.width * 0.05;

    return Container(
      height: appBarHeight,
      width: double.infinity,
      color: ColorsProvider.primaly,
      child: Row(
        children: [
          Visibility(
            visible: isThereArrowBack,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, size: iconSize),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              child: Text(
                isUserName ? title : title.tr(),
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
