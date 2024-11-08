import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/emailVerification.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'dart:async';
import 'package:task_manager/ui/widgets/backGroundImage.dart';
import 'package:task_manager/ui/widgets/logo.dart';

class spashScreens extends StatefulWidget {
  const spashScreens({super.key});

  @override
  State<spashScreens> createState() => _spashScreenState();
}

class _spashScreenState extends State<spashScreens> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const login(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          backGround_image(),
          Center(child: logo()),
        ],
      ),
    );
  }
}
