import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_clients.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/utils/utility.dart';

class setpass extends StatefulWidget {
  const setpass({super.key});

  @override
  State<setpass> createState() => _setpassState();
}

class _setpassState extends State<setpass> {
  Map<String, String> FormValues = {
    "email": "",
    "OTP": "",
    "password": "",
    "cpassword": ""
  };
  bool Loading = false;

  @override
  initState() {
    callStoreData();
    super.initState();
  }

  callStoreData() async {
    String? Email = await read_user_data("EmailVerification");
    print(Email);
    String? OTP = await read_user_data("OTPVerification");
    print(OTP);
    InputOnChange("email", Email);
    InputOnChange("OTP", OTP);
  }

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['password']!.length == 0) {
      ErrorToast('Password Required !');
    } else if (FormValues['password'] != FormValues['cpassword']) {
      ErrorToast('Confirm password should be same!');
    } else {
      setState(() {
        Loading = true;
      });
      print(FormValues);
      bool res = await RecoverResetPassword(FormValues);
      if (res == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => login()),
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
              HeadText('Set Password'),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  onChanged: (Textvalue) {
                    InputOnChange("password", Textvalue);
                  },
                  decoration: AppInputDecoration('Password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  onChanged: (Textvalue) {
                    InputOnChange("cpassword", Textvalue);
                  },
                  decoration: AppInputDecoration('Confirm Password'),
                ),
              ),
              Elevated_green_button(context, 'Confirm ', FormOnSubmit),
              account_text_method(
                  context, 'Already Have Account ?', const login(), 'Log In'),
            ],
          )
        ],
      ),
    );
  }
}
