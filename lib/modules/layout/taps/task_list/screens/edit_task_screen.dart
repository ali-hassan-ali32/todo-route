import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/utils/colors_provider.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';

import '../../../../../core/widgets/app_bar_custom_widget.dart';

class EditTaskScreen extends StatelessWidget {
  static const String routeName = 'EditScreen';
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LayoutProvider(),
      child: Consumer<LayoutProvider>(
        builder: (context, provider, child) {
          var task = ModalRoute.of(context)!.settings.arguments as TaskModel;

          provider.setSelectedDatePicker(
              DateTime.fromMillisecondsSinceEpoch(task.date));
          provider.setTime(_stringToTimeOfDay(task.time));

          return Scaffold(
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  Stack(
                    children: [
                      const AppBarCustomWidget(
                        title: 'edit task',
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
                              children: [
                                Text(
                                  'editTask'.tr(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 32),
                                TextFormField(
                                  initialValue: task.title,
                                  onChanged: (value) {
                                    task.title = value;
                                  },
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w400,
                                      ),
                                  decoration:
                                      InputDecoration(hintText: 'title'.tr()),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  initialValue: task.desc,
                                  onChanged: (value) {
                                    task.desc = value;
                                  },
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
                                      hintText: 'description'.tr()),
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  'Selected Date'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Colors.transparent,
                                    ),
                                  ),
                                  onPressed: () {
                                    showDatePicker(
                                      builder: (context, child) {
                                        return Theme(
                                          data: ThemeData(
                                            colorScheme: ColorScheme.dark(
                                              primary: ColorsProvider.primaly,
                                              onPrimary: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              onSurface: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                            ),
                                            datePickerTheme: Theme.of(context)
                                                .datePickerTheme,
                                          ),
                                          child: child!,
                                        );
                                      },
                                      context: context,
                                      initialDate: provider.selectedDatePicker,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 365)),
                                    ).then((value) {
                                      if (value != null) {
                                        task.date = DateUtils.dateOnly(value)
                                            .millisecondsSinceEpoch;
                                        provider.setSelectedDatePicker(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                task.date));
                                      }
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      DateFormat('yyyy-MM-dd')
                                          .format(provider.selectedDatePicker),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  'selectedTime'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    showTimePicker(
                                      builder: (context, child) {
                                        return Theme(
                                          data: ThemeData(
                                            colorScheme: ColorScheme.dark(
                                              primary: ColorsProvider.primaly,
                                              onPrimary: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              onSurface: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                            ),
                                            datePickerTheme: Theme.of(context)
                                                .datePickerTheme,
                                          ),
                                          child: child!,
                                        );
                                      },
                                      context: context,
                                      initialTime: provider.selectedTime,
                                    ).then((value) {
                                      if (value != null) {
                                        task.time = value.format(context);
                                        provider.setTime(value);
                                      }
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      provider.selectedTime.format(context),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 55),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width, 50),
                                  ),
                                  onPressed: () {
                                    provider.updateTask(task);
                                  },
                                  child: Text(
                                    'saveChanges'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: ColorsProvider.white),
                                  ),
                                ),
                                const SizedBox(height: 20),
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

  TimeOfDay _stringToTimeOfDay(String timeStr) {
    final format = DateFormat.jm();
    return TimeOfDay.fromDateTime(format.parse(timeStr));
  }
}
