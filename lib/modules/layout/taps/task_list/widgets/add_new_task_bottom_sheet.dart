import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/colors_provider.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';

class AddNewTaskBottomSheet extends StatelessWidget {
  AddNewTaskBottomSheet({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LayoutProvider(),
      child: Consumer<LayoutProvider>(builder: (context, provider, child) {
        var mediaQuery = MediaQuery.of(context);

        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(mediaQuery.size.width * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'addNewTask'.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'invaildTitle'.tr();
                      } else {
                        return null;
                      }
                    },
                    controller: provider.titleController,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                    decoration: InputDecoration(hintText: 'title'.tr()),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'invaildDescription'.tr();
                      } else {
                        return null;
                      }
                    },
                    controller: provider.descController,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                    decoration: InputDecoration(hintText: 'description'.tr()),
                  ),
                  const SizedBox(height: 30),
                  Text('selectedDate'.tr()),
                  TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: provider.selectedDatePicker,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ).then((value) {
                        if (value != null) {
                          provider.setSelectedDatePicker(value);
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        DateFormat.yMd(context.locale.toString())
                            .format(provider.selectedDatePicker),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('selectedTime'.tr()),
                  TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      showTimePicker(
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData(
                              colorScheme: ColorScheme.dark(
                                primary: ColorsProvider.primaly,
                                onPrimary:
                                    Theme.of(context).colorScheme.tertiary,
                                onSurface:
                                    Theme.of(context).colorScheme.onTertiary,
                              ),
                              datePickerTheme:
                                  Theme.of(context).datePickerTheme,
                            ),
                            child: child!,
                          );
                        },
                        context: context,
                        initialTime: provider.selectedTime,
                      ).then((value) {
                        if (value != null) {
                          provider.setTime(value);
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        DateFormat('hh:mm a', context.locale.toString())
                            .format(provider.changeTimeOfDayToDate(
                          provider.selectedTime,
                          provider.selectedDatePicker,
                        )),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      fixedSize: Size(mediaQuery.size.width, 55),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.addNewTask(context);
                      }
                    },
                    child: Text(
                      'add'.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
