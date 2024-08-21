import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/models/task_model.dart';
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
          return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    const AppBarCustomWidget(isThereArrowBack: true),
                    Card(
                      elevation: 24,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      margin: const EdgeInsets.fromLTRB(24, 150, 24, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text('edit task'),
                            const SizedBox(height: 52),
                            TextFormField(
                              controller: provider.titleController,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary
                              ),
                              decoration: const InputDecoration(
                                  label: Text('title'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                  )

                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: provider.descController,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary
                              ),
                              decoration: const InputDecoration(
                                label: Text('descripton'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                ),
                              ),
                            ),
                            const SizedBox(height: 32,),
                            const Text(
                              'Selected Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black
                              ),
                            ),
                            TextButton(
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
                                  provider.selectedDatePicker.toString().substring(0, 10),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 100,),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    fixedSize: const Size(400, 50)
                                ),
                                onPressed: () {
                                  if(provider.titleController.text.isNotEmpty) {
                                    task.title = provider.titleController.text;
                                  }
                                  if(provider.descController.text.isNotEmpty) {
                                    task.desc = provider.descController.text;
                                  }
                                  task.date = provider.selectedDate.millisecondsSinceEpoch;
                                  provider.upateTask(task);
                                },
                                child: const Text(
                                  'Save Changes',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white
                                  ),
                                )
                            ),
                            const SizedBox(height: 100,),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


