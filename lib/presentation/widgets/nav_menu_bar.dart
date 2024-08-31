import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavMenuBar extends StatelessWidget {
  const NavMenuBar({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.greenAccent),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 28.0, 28.0, 0.0),
                child: Column(
                  children: [
                    const Text(
                      'SKILL UP NOW',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'TAP HERE',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
              child: ListTile(
                leading: Icon(CupertinoIcons.play_rectangle),
                title: Text(
                  'Episodes',
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.exclamationmark_bubble_fill,
                ),
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
