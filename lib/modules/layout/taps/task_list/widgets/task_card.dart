import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';
import 'package:todo_app/modules/layout/taps/task_list/screens/edit_task_screen.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(
      builder: (_, provider, __) {
        return Container(
          width: double.infinity,
          height: 115,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: const BorderRadius.all(Radius.circular(25))
          ),
          margin: const EdgeInsets.all(16),
          child: Slidable(
            key: const ValueKey(1),
            startActionPane: ActionPane(
              dismissible: DismissiblePane(
                onDismissed: () => provider.deleteTask(task.id),
              ),
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    provider.deleteTask(task.id);
                  },
                  label: 'delete',
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25)
                  ),

                ),
                SlidableAction(
                  onPressed: (_) {
                   Navigator.pushNamed(_, EditTaskScreen.routeName,arguments: task);
                  },
                  label: 'edit',
                  icon: Icons.edit,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  height: 64,
                  width: 4,
                  color: Colors.blue,
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                            fontSize: 18,
                            color: task.isDone
                                ? Colors.green
                                : Colors.blue,
                        ),
                      ),
                      Text(
                        task.desc,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Icons.timelapse,color: Colors.grey,size: 25,),
                          SizedBox(width: 5,),
                          Text('10:00')
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Visibility(
                    visible: task.isDone,
                    replacement:  ElevatedButton(
                        onPressed: () {
                          task.isDone = !task.isDone;
                          provider.upateTask(task);
                        },
                        child: const Icon(Icons.done,color: Colors.white,size: 32,)
                    ),
                    child: TextButton(
                      onPressed: () {
                        task.isDone = !task.isDone;
                        provider.upateTask(task);
                      },
                      child: const Text(
                        'Done!',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
