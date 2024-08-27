import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/auth/manger/auth_provider.dart';
import 'package:todo_app/modules/layout/mangers/layout_provider.dart';

import '../../taps/task_list/widgets/add_new_task_bottom_sheet.dart';

class LayoutScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var iconSize = size.width * 0.08;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LayoutProvider()),
      ],
      child: Selector<LayoutProvider, int>(
        selector: (_, layoutProvider) => layoutProvider.selectedIndex,
        builder: (context, selectedTab, child) {
          var layoutProvider =
              Provider.of<LayoutProvider>(context, listen: false);
          return Scaffold(
            extendBody: true,
            floatingActionButton: SizedBox(
              height: size.width * 0.18,
              width: size.width * 0.18,
              child: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                        value: layoutProvider,
                        child: AddNewTaskBottomSheet(),
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.add,
                  size: iconSize,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: size.width * 0.03,
              child: BottomNavigationBar(
                currentIndex: selectedTab,
                onTap: layoutProvider.setTapIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list, size: iconSize),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings, size: iconSize),
                    label: '',
                  ),
                ],
              ),
            ),
            body: layoutProvider.tabs[selectedTab],
          );
        },
      ),
    );
  }
}
