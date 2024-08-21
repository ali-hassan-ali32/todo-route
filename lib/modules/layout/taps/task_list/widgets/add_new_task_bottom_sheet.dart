import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';

class AddNewTaskBottomSheet extends StatelessWidget {

  const AddNewTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LayoutProvider(),
      child: Consumer<LayoutProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Add New Task',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 10,),
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
                  const SizedBox(height: 10,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          fixedSize: const Size(400, 50)
                      ),
                      onPressed: () {
                        provider.addNewTask(context);
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),
                      )
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
