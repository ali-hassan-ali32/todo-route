import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/utils/colors_provider.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';
import 'package:todo_app/modules/layout/taps/task_list/screens/edit_task_screen.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Consumer<LayoutProvider>(
      builder: (_, provider, __) {
        return Card(
          margin: EdgeInsets.all(width * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.03),
          ),
          child: SizedBox(
            width: width * 0.9,
            height: height * 0.15,
            child: Slidable(
              key: ValueKey(task.id),
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
                    label: 'delete'.tr(),
                    icon: Icons.delete,
                    backgroundColor: ColorsProvider.deleteColor,
                    foregroundColor: ColorsProvider.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.03),
                      bottomLeft: Radius.circular(width * 0.03),
                    ),
                  ),
                  SlidableAction(
                    onPressed: (_) {
                      Navigator.pushNamed(_, EditTaskScreen.routeName,
                          arguments: task);
                    },
                    label: 'edit',
                    icon: Icons.edit,
                    backgroundColor: ColorsProvider.primaly,
                    foregroundColor: ColorsProvider.white,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: width * 0.02),
                  Container(
                    height: height * 0.1,
                    width: width * 0.02,
                    decoration: BoxDecoration(
                      color: task.isDone
                          ? ColorsProvider.doneColor
                          : ColorsProvider.primaly,
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: task.isDone
                                        ? ColorsProvider.doneColor
                                        : ColorsProvider.primaly,
                                  ),
                        ),
                        Text(
                          task.desc,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: width * 0.04,
                                  ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timelapse,
                              color: Theme.of(context).colorScheme.tertiary,
                              size: width * 0.05,
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              task.time,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color!
                                        .withOpacity(0.8),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: InkWell(
                      onTap: () => provider.setDone(task),
                      child: task.isDone
                          ? Text(
                              'done'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: ColorsProvider.doneColor,
                                  ),
                            )
                          : Container(
                              width: width * 0.22,
                              height: height * 0.05,
                              decoration: BoxDecoration(
                                color: ColorsProvider.primaly,
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
                              ),
                              child: Icon(
                                Icons.done,
                                size: width * 0.06,
                                color: ColorsProvider.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
