import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

SizedBox Elevated_green_button(BuildContext context, String text, root) {
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => root),
          );
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
