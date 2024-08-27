import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Consumer<LayoutProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Stack(
              children: [
                AppBarCustomWidget(
                  title: provider.user?.name.toUpperCase() ?? '',
                  isUserName: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.2),
                  child: EasyInfiniteDateTimeLine(
                    locale: context.locale.toString(),
                    firstDate: FirebaseAuth
                        .instance.currentUser!.metadata.creationTime!,
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    focusDate: provider.selectedDate,
                    onDateChange: provider.setSelectedDate,
                    activeColor: Colors.lightBlueAccent,
                    dayProps: EasyDayProps(
                      todayHighlightColor:
                          Theme.of(context).colorScheme.primary,
                      height: height * 0.12,
                      activeDayStyle: DayStyle(
                        dayNumStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: width * 0.04,
                                ),
                        dayStrStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: width * 0.04,
                                ),
                        monthStrStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: width * 0.04,
                                ),
                      ),
                      todayStyle: DayStyle(
                        dayNumStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: width * 0.04,
                                ),
                        dayStrStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: width * 0.04,
                                ),
                        monthStrStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontSize: width * 0.04,
                                ),
                      ),
                      todayHighlightStyle: TodayHighlightStyle.withBackground,
                      inactiveDayStyle: DayStyle(
                        dayNumStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!
                                      .withOpacity(0.8),
                                  fontSize: width * 0.04,
                                ),
                        dayStrStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!
                                      .withOpacity(0.8),
                                  fontSize: width * 0.04,
                                ),
                        monthStrStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!
                                      .withOpacity(0.8),
                                  fontSize: width * 0.04,
                                ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                    showTimelineHeader: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.001),
            Expanded(
              child: StreamBuilder(
                stream: provider.getTasksList(provider.selectedDate),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('errorHappen'.tr()),
                    );
                  } else {
                    List<TaskModel> tasks =
                        snapshot.data!.docs.map((e) => e.data()).toList();
                    if (tasks.isEmpty) {
                      return Center(
                        child: Text(
                          'listEmpty'.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    } else {
                      return ListView.separated(
                        itemBuilder: (context, index) =>
                            TaskCard(task: tasks[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: height * 0.02),
                        itemCount: tasks.length,
                      );
                    }
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
