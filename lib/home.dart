import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  snackbar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(10.0, 30.0),
    backgroundColor: Colors.green,
    //textStyle: TextStyle(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Greeting App',
          style: TextStyle(color: Colors.black87, fontSize: 19.0),
        ),
        backgroundColor: Colors.white24,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Hello, World!',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Welcome to Flutter!',
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Image.asset('assets/download.png'),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: () {
                  snackbar(context, 'Button Pressed!');
                },
                style: buttonStyle,
                child: const Text(
                  'Press Me',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
