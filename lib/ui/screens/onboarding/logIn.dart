import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background_picture(context),
          Container(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: TextFormField(
                    decoration: AppInputDecoration('Password'),
                  ),
                ),
                Elevated_green_button(context, 'Log In', bottom_navigator()),

                Padding(
                    padding: const EdgeInsets.fromLTRB(130, 60, 30, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const setpass(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forget Password ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )),

                account_text_method(
                    context, 'Don`t Have Account ?', const signup(), 'Sign Up'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
