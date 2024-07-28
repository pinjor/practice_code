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
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
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
              snackbar(context, 'add icon');
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              snackbar(context, 'message icon');
            },
            icon: Icon(Icons.message),
          ),
        ],
      ),
      body: Center(
        child: Text('newly runned'),
      ),
    );
  }
}
