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
              height: size.width * 0.16,
              width: size.width * 0.16,
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
                child: const Icon(
                  Icons.add,
                  size: 25,
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
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list, size: 32),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings, size: 32),
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
