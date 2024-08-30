import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/models/user_model.dart';
import 'package:todo_app/core/servises/firebase_function/firebase_functions.dart';
import 'package:todo_app/modules/layout/taps/setting/screens/setting_tab.dart';
import 'package:todo_app/modules/layout/taps/task_list/screens/task_list_tab.dart';

class LayoutProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  int selectedIndex = 0;
  final TextEditingController descController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  UserModel? user;
  String localeDropDownValue = 'english';
  DateTime selectedDatePicker = DateTime.now();

  final List<Widget> tabs = [const TaskListTab(), const SettingTab()
  ];



  void addNewTask(BuildContext context) async{
    TaskModel task = TaskModel(
      time: DateFormat('h:mm a', context.locale.toString())
          .format(changeTimeOfDayToDate(selectedTime, selectedDatePicker)),
      title: titleController.text,
      desc: descController.text,
      date: DateUtils.dateOnly(selectedDatePicker).millisecondsSinceEpoch,
    );
    await FirebaseFunctions.addTask(task).then((_) {
      notifyListeners();
      titleController.clear();
      descController.clear();
      Navigator.pop(context);
    });
  }

  Stream<QuerySnapshot<TaskModel>> getTasksList(DateTime date) {
    return FirebaseFunctions.getTasksList(date);
  }
  void deleteTask(String id){
    FirebaseFunctions.deleteTask(id);
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    FirebaseFunctions.updateTask(task);
    notifyListeners();
  }

  void setDone(TaskModel task) {
    FirebaseFunctions.setDone(task);
    notifyListeners();
  }

  void setTime(TimeOfDay newTime) {
    selectedTime = newTime;
    notifyListeners();
  }


  void setTapIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
  void setSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  void setSelectedDatePicker(DateTime newDate) {
    selectedDatePicker = newDate;
    notifyListeners();
  }

  DateTime changeTimeOfDayToDate(TimeOfDay time, DateTime date) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }
}