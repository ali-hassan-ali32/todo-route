import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/servises/firebase_function/firebase_functions.dart';
import 'package:todo_app/modules/layout/taps/setting/screens/setting_tab.dart';
import 'package:todo_app/modules/layout/taps/task_list/screens/task_list_tab.dart';

class LayoutProvider extends ChangeNotifier {
  int selectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDatePicker = DateTime.now();
  List<Widget> tabs = [
    const TaskListTab(),
    const SettingTab()
  ];

  void addNewTask(BuildContext context) async{
    TaskModel task = TaskModel(
        title: titleController.text,
        desc: descController.text,
        date: selectedDate.millisecondsSinceEpoch
    );
    await FirebaseFunctions.addTask(task).then((_) {
      titleController.clear();
      descController.clear();
      Navigator.pop(context);
    });
    notifyListeners();
  }
  Future<QuerySnapshot<TaskModel>> getTasksList() {
    return FirebaseFunctions.getTasksList();
  }
  void deleteTask(String id){
    FirebaseFunctions.deleteTask(id);
    notifyListeners();
  }
  void upateTask(TaskModel task) async{
    await FirebaseFunctions.updateTask(task);
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
  void setSelectedDatePicker(DateTime newADate) {
    selectedDatePicker = newADate;
    notifyListeners();
  }
}