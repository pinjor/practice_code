import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/utils/url.dart';
import 'package:task_manager/ui/widgets/snacbar.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailTEcontroller = TextEditingController();
  final TextEditingController firstnameTEcontroller = TextEditingController();
  final TextEditingController lastnameTEcontroller = TextEditingController();
  final TextEditingController mobileTEcontroller = TextEditingController();
  final TextEditingController passwordTEcontroller = TextEditingController();

  bool _inprogress = false;

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
              HeadText('Joint With Us'),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  controller: emailTEcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppInputDecoration('Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter valid mail';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  controller: firstnameTEcontroller,
                  decoration: AppInputDecoration('First Name'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter valid firstname';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  controller: lastnameTEcontroller,
                  decoration: AppInputDecoration('Last Name'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter valid lastname';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  controller: mobileTEcontroller,
                  decoration: AppInputDecoration('Mobile'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter valid mobile';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextFormField(
                  controller: passwordTEcontroller,
                  decoration: AppInputDecoration('Password'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter valid password';
                    }
                  },
                ),
              ),
              Elevated_green_button(context, 'Sign Up', const login()),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text('Sign UP'),
              // ),
              account_text_method(
                  context, 'Already Have Account ?', const login(), 'Log In'),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> signup() async {
    _inprogress = true;

    setState(() {});

    Map<String, dynamic> requestbody = {
      "email": emailTEcontroller.text.trim(),
      "firstName": firstnameTEcontroller.text.trim(),
      "lastName": lastnameTEcontroller.text.trim(),
      "mobile": mobileTEcontroller.text.trim(),
      "password": passwordTEcontroller.text.trim(),
    };

    NetworkResponse response = await NetworkCaller.postRequest(
        url: urls.registration, body: requestbody);
    if (response.issuccess) {
      showsnackbarmessage(context, 'New User Created');
    } else {
      showsnackbarmessage(context, response.errorMessage, true);
    }
  }

  @override
  void dispose() {
    emailTEcontroller.dispose();
    firstnameTEcontroller.dispose();
    lastnameTEcontroller.dispose();
    mobileTEcontroller.dispose();
    passwordTEcontroller.dispose();
    super.dispose();
  }
}
