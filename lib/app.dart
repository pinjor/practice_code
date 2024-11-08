import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/splashScreen.dart';

class task_manager extends StatelessWidget {
  const task_manager({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: spashScreens(),
    );
  }
}
