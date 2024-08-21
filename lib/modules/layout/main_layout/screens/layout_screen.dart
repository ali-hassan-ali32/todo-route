import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';
import '../../taps/task_list/widgets/add_new_task_bottom_sheet.dart';

class LayoutScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LayoutProvider(),
        child: Selector<LayoutProvider, int>(
          selector: (p0, p1) => p1.selectedIndex,
          builder: (context, selectedTab, child) {
            var layoutProvider =
            Provider.of<LayoutProvider>(context, listen: false);
            return Scaffold(
                extendBody: true,
                floatingActionButton: SizedBox(
                  height: 75,
                  width: 75,
                  child: FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return ChangeNotifierProvider.value(
                            value: layoutProvider,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: const AddNewTaskBottomSheet(),
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      size: 35,
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 12,
                  child: BottomNavigationBar(
                    currentIndex: selectedTab,
                    onTap: layoutProvider.setTapIndex,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.list), label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.settings), label: ''),
                    ],
                  ),
                ),
                body: layoutProvider.tabs[selectedTab]);
          },
        )
    );
  }


}

