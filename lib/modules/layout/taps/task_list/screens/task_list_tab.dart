import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';
import 'package:todo_app/modules/layout/taps/task_list/widgets/task_card.dart';
import '../../../../../core/widgets/app_bar_custom_widget.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(
      builder: (context, provider, child) {
        return Column(
              children: [
                Stack(
                  alignment: const Alignment(0, 1.8),
                  children: [
                    const AppBarCustomWidget(),
                    EasyInfiniteDateTimeLine(
                      locale: context.locale.toString(),
                      firstDate: DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      focusDate: provider.selectedDate,
                      onDateChange: provider.setSelectedDate,
                      activeColor: const Color(0xff187ccc),
                      dayProps: EasyDayProps(
                        height: 100,
                        todayStyle: DayStyle(
                          dayNumStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          dayStrStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          monthStrStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        todayHighlightStyle: TodayHighlightStyle.withBackground,
                        todayHighlightColor: const Color(0xff3a56c4),
                        inactiveDayStyle: DayStyle(
                          dayNumStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          dayStrStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          monthStrStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                      showTimelineHeader: false,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                FutureBuilder(
                    future: provider.getTasksList(),
                    builder: (_, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }else if(snapshot.hasError) {
                        return const Text('Error Happen');
                      }else{
                        List<TaskModel> tasks =
                        snapshot.data!.docs.map((e) => e.data()).toList();
                        if(tasks.isEmpty) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                'the List is Empty',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          );
                        }else {
                          return Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    TaskCard(task: tasks[index]),
                                separatorBuilder: (context,
                                    index) => const SizedBox(height: 10,),
                                itemCount: tasks.length),
                          );
                        }
                      }
                    },)
              ],
            );
        },
    );
  }
}
