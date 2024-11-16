import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/data/services/api_clients.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/screens/onboarding/setPassword.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:pinput/pinput.dart';
import 'package:task_manager/ui/utils/utility.dart';

class pinvarifications extends StatefulWidget {
  const pinvarifications({super.key});

  @override
  State<pinvarifications> createState() => _pinvarificationsState();
}

class _pinvarificationsState extends State<pinvarifications> {
  Map<String, String> FormValues = {"otp": ""};
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['otp']!.length != 6) {
      ErrorToast('PIN Required !');
    } else {
      setState(() {
        Loading = true;
      });
      String? emailAddress = await read_user_data('EmailVerification');
      bool res = await RecoverVerifyotp(emailAddress, FormValues['otp']);
      if (res == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => setpass()),
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
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
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
                  // const Directionality(
                  //   textDirection: TextDirection.ltr,

                  //     child: Pinput(
                  //       length: 6,
                  //     ),
                  //   ),
                  // ),
                  PinCodeTextField(
                      appContext: context,
                      length: 6,
                      pinTheme: AppOTPStyle(),
                      animationType: AnimationType.fade,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {},
                      onChanged: (value) {
                        InputOnChange("otp", value);
                      }),
                  Elevated_green_button(context, 'Verify', FormOnSubmit),
                  account_text_method(context, 'Already Have Account ?',
                      const login(), 'Log In'),
                  //  )
                ]),
          )
        ],
      ),
    );
  }
}
