import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/onboarding/add_new_task_screen.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/screens/onboarding/profile_screen.dart';
import 'package:task_manager/ui/widgets/Tm_Appbar.dart';

SvgPicture background_picture(BuildContext context) {
  return SvgPicture.asset(
    'assets/images/background.svg',
    fit: BoxFit.cover,
    height: MediaQuery.sizeOf(context).height,
    width: MediaQuery.sizeOf(context).width,
  );
}

Chip build_task_status_Chip() {
  return Chip(
    label: Text(
      'New',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.tealAccent,
  );
}

InputDecoration AppInputDecoration(label) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green, width: 1),
    ),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 0.0),
    ),
    border: const OutlineInputBorder(),
    labelText: label,
    labelStyle: const TextStyle(color: Colors.grey),
  );
}

SizedBox ItemSizeBox(child) {
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: EdgeInsets.all(10),
      child: child,
    ),
  );
}

TextStyle Head1Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle Head6Text(textColor) {
  return TextStyle(
      color: textColor,
      fontSize: 16,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400);
}

TextStyle Head7Text(textColor) {
  return TextStyle(
      color: textColor,
      fontSize: 13,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400);
}

TextStyle Head9Text(textColor) {
  return TextStyle(
      color: textColor,
      fontSize: 9,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w500);
}

DecoratedBox AppDropDownStyle(child) {
  return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child:
          Padding(padding: EdgeInsets.only(left: 30, right: 30), child: child));
}

SvgPicture ScreenBackground(context) {
  return SvgPicture.asset(
    'assets/images/screen-back.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}

ButtonStyle AppStatusButtonStyle(btnColor) {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: btnColor,
  );
}

TextStyle ButtonTextStyle() {
  return TextStyle(
      fontSize: 14, fontFamily: 'poppins', fontWeight: FontWeight.w400);
}

Ink SuccessButtonChild(String ButtonText) {
  return Ink(
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,
        style: ButtonTextStyle(),
      ),
    ),
  );
}

Container StatusChild(statusText, statusColor) {
  return Container(
    alignment: Alignment.center,
    child: Text(statusText,
        style: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: statusColor,
    ),
    height: 20,
    width: 60,
  );
}

Padding HeadText(String a) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 0, 0, 5),
    child: Text(
      a,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 33.0, color: Colors.black),
    ),
  );
}

// Widget appbar(BuildContext context) {
//   return Tm_Appbar();
// }

SizedBox Elevated_green_button(
    BuildContext context, String text, Function function) {
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        onPressed: () {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => root),
          // );
          function();
          //FormOnSubmit();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Padding dashboard_card(String task_no, String task_title) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task_no),
            Text(task_title),
          ],
        ),
      ),
    ),
  );
}

FloatingActionButton buildFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => add_new_task_screen(),
        ),
      );
    },
    child: Icon(Icons.add),
  );
}

void SuccessToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

void ErrorToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

PinTheme AppOTPStyle() {
  return PinTheme(
    inactiveColor: Colors.lightGreen,
    inactiveFillColor: Colors.white,
    selectedColor: Colors.green,
    activeColor: Colors.green,
    selectedFillColor: Colors.green,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: Colors.white,
  );
}

Padding account_text_method(BuildContext context, String a, b, String d) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(130, 5, 30, 5),
    child: Row(
      children: [
        Text(
          a,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => b),
              );
            },
            child: Text(
              d,
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ))
      ],
    ),
  );
}
