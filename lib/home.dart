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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Drawer'),
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
