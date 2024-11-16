import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/utils/utility.dart';

AppBar TaskAppBar(context, ProfileData) {
  return AppBar(
    backgroundColor: Colors.green,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            // child: ClipOval(
            //   child: Image.memory(ShowBase64Image(ProfileData['photo'])),
            // ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${ProfileData['firstName']} ${ProfileData['lastName']}',
                style: Head7Text(Colors.white),
              ),
              Text(
                ProfileData['email'],
                style: Head9Text(Colors.white),
              )
            ],
          )
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/taskCreate");
          },
          icon: Icon(Icons.add_circle_outline)),
      IconButton(
          onPressed: () async {
            await RemoveToken();
            Navigator.pushNamedAndRemoveUntil(
                context, "/login", (route) => false);
          },
          icon: Icon(Icons.output))
    ],
  );
}
