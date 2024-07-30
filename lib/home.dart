import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  snackbar(BuildContext context, message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text('masfak'),
                accountEmail: Text('masfak@gmail.com'),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          title: Text('practice one'),
          backgroundColor: Colors.tealAccent,
          actions: [
            IconButton(
              onPressed: () {
                snackbar(context, 'addd icon');
              },
              icon: Icon(Icons.add),
            ),
          ]),
    );
  }
}
