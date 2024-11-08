import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/utils/styles.dart';

class setpass extends StatefulWidget {
  const setpass({super.key});

  @override
  State<setpass> createState() => _setpassState();
}

class _setpassState extends State<setpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background_picture(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadText('Set Password'),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  decoration: AppInputDecoration('Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  decoration: AppInputDecoration('Confirm Password'),
                ),
              ),
              Elevated_green_button(context, 'Next ', const login()),
              account_text_method(
                  context, 'Already Have Account ?', const login(), 'Log In'),
            ],
          )
        ],
      ),
    );
  }
}
