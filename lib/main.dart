import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/ui/utils/utility.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await read_user_data('token');
  if (token == null) {
    runApp(task_manager(first_route: "/"));
  } else {
    runApp(task_manager(first_route: "/login"));
  }
}
