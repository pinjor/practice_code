import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/add_new_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/new_task_screen.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/widgets/Tm_Appbar.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Tm_Appbar(),
      body: Stack(
        children: [
          background_picture(context),
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadText('Update Profile'),
                  SizedBox(
                    height: 48.0,
                  ),
                  _buildphotopicker(),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration('Email'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration('First Name'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration('Last Name'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration('Mobile'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration('Password'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Elevated_green_button(context, 'Update', new_task_screen()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildphotopicker() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              height: 100,
              width: 68,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Photos',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Select Photo',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      //color: Colors.white,
    );
  }
}
