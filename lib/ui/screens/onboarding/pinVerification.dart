import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/screens/onboarding/setPassword.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:pinput/pinput.dart';

class pinvarifications extends StatefulWidget {
  const pinvarifications({super.key});

  @override
  State<pinvarifications> createState() => _pinvarificationsState();
}

class _pinvarificationsState extends State<pinvarifications> {
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
                HeadText('PIN Verification'),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 30),
                  child: Text(
                    'Six Digit Verification Pin Will Send To Your Email Address',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Directionality(
                  textDirection: TextDirection.ltr,
                  child: Center(
                    child: Pinput(
                      length: 6,
                    ),
                  ),
                ),
                Elevated_green_button(context, 'Verify', const setpass()),
                account_text_method(
                    context, 'Already Have Account ?', const login(), 'Log In'),
              ])
        ],
      ),
    );
  }
}
