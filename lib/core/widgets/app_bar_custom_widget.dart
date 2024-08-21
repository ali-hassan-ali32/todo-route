import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../modules/layout/taps/task_list/screens/edit_task_screen.dart';

class AppBarCustomWidget extends StatelessWidget {
  const AppBarCustomWidget({
    super.key,
    this.title = 'toDoList',
    this.isThereArrowBack = false
  });

  final String title;
  final bool isThereArrowBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Visibility(
                visible: isThereArrowBack,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}