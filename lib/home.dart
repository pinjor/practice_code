import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  home({super.key});

  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 60),
    backgroundColor: Colors.blueGrey,
    //textStyle: TextStyle(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Text Field'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text('First Name'),
                border: OutlineInputBorder(),
                hintText: 'Enter First Name',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                label: Text('Last Name'),
                border: OutlineInputBorder(),
                hintText: 'Enter Last Name',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                label: Text('Email Address'),
                border: OutlineInputBorder(),
                hintText: 'Enter Email Address',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Submit',
              ),
              style: buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
