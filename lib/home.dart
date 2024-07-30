import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  snackbar(BuildContext context, message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  alertbox(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text('alert dialog'),
            titlePadding: EdgeInsets.all(20.0),
            content: Text('Do you want to delete'),
            contentPadding: EdgeInsets.all(20.0),
            actions: [
              TextButton(
                onPressed: () {
                  snackbar(context, 'deletion done');
                  Navigator.of(context).pop();
                },
                child: Text('yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
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
        ],
      ),
      body: ElevatedButton(
        onPressed: () {
          alertbox(context);
        },
        child: Center(
          child: Text('click me'),
        ),
      ),
    );
  }
}
