import 'package:flutter/material.dart';
import 'package:task_manager/MapPage.dart';

class task_manager extends StatelessWidget {
  final first_route;
  task_manager({this.first_route, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MapPage());
  }
}
