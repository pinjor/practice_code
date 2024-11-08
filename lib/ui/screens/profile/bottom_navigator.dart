import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:task_manager/ui/screens/onboarding/canceled_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/compled_task_screen.dart';

import 'package:task_manager/ui/screens/onboarding/new_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/processing_task_screen.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/widgets/Tm_Appbar.dart';

class bottom_navigator extends StatefulWidget {
  bottom_navigator({super.key});

  @override
  State<bottom_navigator> createState() => bottom_navigatorState();
}

class bottom_navigatorState extends State<bottom_navigator> {
  int _selectedindex = 0;
  List screens = [
    new_task_screen(),
    compled_task_screen(),
    canceled_task_screen(),
    processing_task_screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: Tm_Appbar(),
      body: screens[_selectedindex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedindex,
        onDestinationSelected: (int index) {
          _selectedindex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.add_task), label: 'New'),
          NavigationDestination(icon: Icon(Icons.done_all), label: 'Completed'),
          NavigationDestination(icon: Icon(Icons.cancel), label: 'Cancel'),
          NavigationDestination(
              icon: Icon(Icons.pending_actions), label: 'Processessing'),
        ],
      ),
    );
  }
}
