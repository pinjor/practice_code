import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/add_new_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/emailVerification.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/screens/onboarding/new_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/pinVerification.dart';
import 'package:task_manager/ui/screens/onboarding/registration.dart';
import 'package:task_manager/ui/screens/onboarding/setPassword.dart';
import 'package:task_manager/ui/screens/onboarding/splashScreen.dart';

class task_manager extends StatelessWidget {
  final first_route;
  task_manager({this.first_route, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: first_route,
      routes: {
        '/': (context) => spashScreens(),
        '/login': (context) => login(),
        '/registration': (context) => signup(),
        '/emailVerification': (context) => email_verification(),
        '/pinVerification': (context) => pinvarifications(),
        '/setPassword': (context) => setpass(),
        '/taskCreate': (context) => add_new_task_screen()
      },
      debugShowCheckedModeBanner: false,
      //home:  spashScreens(),
    );
  }
}
