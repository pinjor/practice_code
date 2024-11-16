import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_clients.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/screens/onboarding/pinVerification.dart';
import 'package:task_manager/ui/utils/styles.dart';

class email_verification extends StatefulWidget {
  const email_verification({super.key});

  @override
  State<email_verification> createState() => _email_verificationState();
}

class _email_verificationState extends State<email_verification> {
  Map<String, String> FormValues = {"email": ""};
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
    print(FormValues);
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast('Email Required !');
    } else {
      setState(() {
        Loading = true;
      });

      bool res = await RecoverVerifyEmail(FormValues['email']);
      print(res);
      if (res == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => pinvarifications()),
        );
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

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
                  onChanged: (Textvalue) {
                    InputOnChange('email', Textvalue);
                  },
                ),
              ),
              Elevated_green_button(context, 'Next ', FormOnSubmit),
              account_text_method(
                  context, 'Already Have Account ?', const login(), 'Log In'),
            ],
          )
        ],
      ),
    );
  }
}
