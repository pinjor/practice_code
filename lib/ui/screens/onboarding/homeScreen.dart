import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/canceled_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/compled_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/new_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/processing_task_screen.dart';
import 'package:task_manager/ui/utils/utility.dart';
import 'package:task_manager/ui/widgets/TaskAppBar.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int TabIndex = 0;
  Map<String, String> ProfileData = {
    "email": "",
    "firstName": "",
    "lastName": "",
  };

  onItemTapped(int index) {
    setState(() {
      TabIndex = index;
    });
  }

  final widgetOptions = [
    new_task_screen(),
    processing_task_screen(),
    compled_task_screen(),
    canceled_task_screen()
  ];

  ReadAppBarData() async {
    String? email = await read_user_data('email');
    String? firstName = await read_user_data('firstName');
    String? lastName = await read_user_data('lastName');

    setState(() {
      ProfileData = {
        "email": '$email',
        "firstName": '$firstName',
        "lastName": '$lastName',
      };
    });
  }

  @override
  void initState() {
    ReadAppBarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(context, ProfileData),
      body: widgetOptions.elementAt(TabIndex),
      //bottomNavigationBar: appBottomNav(TabIndex, onItemTapped),
    );
  }
}
