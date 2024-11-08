import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/screens/onboarding/pinVerification.dart';
import 'package:task_manager/ui/utils/styles.dart';

class email_verification extends StatefulWidget {
  const email_verification({super.key});

  @override
  State<email_verification> createState() => _email_verificationState();
}

class _email_verificationState extends State<email_verification> {
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
              HeadText('Your Email Address'),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  decoration: AppInputDecoration('Email'),
                ),
              ),
              Elevated_green_button(context, 'Next ', const pinvarifications()),
              account_text_method(
                  context, 'Already Have Account ?', const login(), 'Log In'),
            ],
          )
        ],
      ),
    );
  }
}
