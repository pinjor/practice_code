import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/new_task_screen.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/widgets/Tm_Appbar.dart';

class add_new_task_screen extends StatefulWidget {
  const add_new_task_screen({super.key});

  @override
  State<add_new_task_screen> createState() => _add_new_task_screenState();
}

class _add_new_task_screenState extends State<add_new_task_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Tm_Appbar(),
      body: Stack(children: [
        background_picture(context),
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeadText('Add New Task'),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  decoration: AppInputDecoration('Title'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: AppInputDecoration('Descriptions'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Elevated_green_button(
                  context,
                  'Add',
                  new_task_screen(),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
