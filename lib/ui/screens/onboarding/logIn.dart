import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_clients.dart';
import 'package:task_manager/ui/screens/onboarding/emailVerification.dart';
import 'package:task_manager/ui/screens/onboarding/new_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/registration.dart';
import 'package:task_manager/ui/screens/onboarding/setPassword.dart';
import 'package:task_manager/ui/screens/profile/bottom_navigator.dart';
import 'package:task_manager/ui/utils/styles.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  Map<String, String> FormValues = {"email": "", "password": ""};
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
    } else if (FormValues['password']!.length == 0) {
      ErrorToast('Password Required !');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await LoginRequest(FormValues);
      print(res);
      if (res == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => new_task_screen()),
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
          Container(
            alignment: Alignment.center,
            child: Loading
                ? (Center(child: CircularProgressIndicator()))
                : (SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 20,
                        // ),
                        HeadText('Get Started With'),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            decoration: AppInputDecoration('Email'),
                            onChanged: (Textvalue) {
                              InputOnChange('email', Textvalue);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            decoration: AppInputDecoration('Password'),
                            onChanged: (Textvalue) {
                              print("Password Field Updated: $Textvalue");
                              InputOnChange('password', Textvalue);
                            },
                          ),
                        ),
                        Elevated_green_button(context, 'Log In', FormOnSubmit),

                        Padding(
                            padding: const EdgeInsets.fromLTRB(130, 60, 30, 0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const email_verification(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Forget Password ?',
                                style: TextStyle(color: Colors.grey),
                              ),
                            )),

                        account_text_method(context, 'Don`t Have Account ?',
                            const signup(), 'Sign Up'),
                      ],
                    ),
                  )),
          ),
        ],
      ),
    );
  }
}
