import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.tealAccent),
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
                leading: Icon(Icons.local_movies_outlined),
                title: Text(
                  'Episodes',
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
              child: ListTile(
                leading: Icon(Icons.sms_failed_rounded),
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
