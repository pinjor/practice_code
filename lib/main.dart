import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text Styling App'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text(
                      'Flutter Text Styling',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                    subtitle: Text(
                      'Experiment with text styles',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 16.0),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        showSnackbar(context, 'You clicked the button!');
                      },
                      child: Text('Click Me'))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
