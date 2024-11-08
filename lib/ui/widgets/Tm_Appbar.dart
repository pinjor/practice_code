import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/onboarding/logIn.dart';
import 'package:task_manager/ui/screens/onboarding/profile_screen.dart';

class Tm_Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Tm_Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          // Navigate to profile screen on tap
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => profile_screen(),
              ));
        },
        child: Row(
          children: [
            CircleAvatar(),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Md.Masfakuzzaman',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'pinjor033@gmail.com',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              // Log out and navigate to the login screen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => login()),
                (predicate) => false,
              );
            },
            icon: Icon(Icons.exit_to_app))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
