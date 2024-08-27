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
  int selectedIndex = 0;
  String localeDropDownValue = 'english';
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDatePicker = DateTime.now();
  final List<Widget> tabs = [const TaskListTab(), const SettingTab()
  ];

  late StreamSubscription<UserModel?> _userSubscription;
  UserModel? user;

  LayoutProvider() {
    _listenToUserStream();
  }

  void _listenToUserStream() {
    _userSubscription = FirebaseFunctions.getUser().listen((userData) {
      user = userData;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userSubscription.cancel();
    super.dispose();
  }

//############################# Task Servises ##################################
  void addNewTask(BuildContext context) async{
    TaskModel task = TaskModel(
      time: DateFormat('h:mm a', context.locale.toString())
          .format(convertTimeOfDayToDateTime(selectedTime, selectedDatePicker)),
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

//############################# User Servises ##################################
  void setName(String newName) {
    if (user != null) {
      user?.name = newName;
    }
    notifyListeners();
  }

  void updateUser() {
    FirebaseFunctions.updateUser(user);
    notifyListeners();
  }

//############################# aother Servises ################################
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

  DateTime convertTimeOfDayToDateTime(TimeOfDay time, DateTime date) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }
}