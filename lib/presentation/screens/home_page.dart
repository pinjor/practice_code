import 'package:flutter/material.dart';
import 'package:practice_one/presentation/widgets/nav_menu_bar.dart';
import 'package:practice_one/presentation/widgets/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive_builder(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  alertbox(context) {
    return _builderShowDialog(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('HUMMING'),
              Text('BIRD .'),
            ],
          ),
        ),
      ),
      drawer: NavMenuBar(context: context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        child: Center(
          child: Column(
            children: [
              const Text('FLUTTER WEB.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              const Text('THE BESICS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'In This course we will go over the basics of using ',
                style: TextStyle(height: 1.4),
              ),
              Text(
                'Flutter Web for development. Topics will include',
                style: TextStyle(height: 1.4),
              ),
              const Text(
                'Responsive Layout, Deploying, Font Changes, Hover ',
                style: TextStyle(height: 1.4),
              ),
              const Text(
                'functionality, Modals and more. ',
                style: TextStyle(height: 1.4),
              ),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: ElevatedButton(
                  onPressed: () {
                    alertbox(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                  child: const Center(
                    child: Text('join course'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HUMMING'),
                  Text('BIRD .'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Episodes'),
                  SizedBox(
                    width: 30,
                  ),
                  Text('About'),
                ],
              ),
            )
          ],
        ),
      )),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
        child: Center(
          child: Column(
            children: [
              Text('FLUTTER WEB.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              Text('THE BESICS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'In This course we will go over the basics of using ',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.4,
                ),
              ),
              Text('Flutter Web for development. Topics will include',
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.4,
                  )),
              Text(
                'Responsive Layout, Deploying, Font Changes, Hover ',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.4,
                ),
              ),
              Text(
                'functionality, Modals and more. ',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(280, 100.0, 280.0, 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    alertbox(context);
                  },
                  child: const Center(
                    child: Text('join course'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Padding(
        padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HUMMING'),
                  Text('BIRD .'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Episodes'),
                  SizedBox(
                    width: 30,
                  ),
                  Text('About'),
                ],
              ),
            )
          ],
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                    child: Text('FLUTTER WEB.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                    child: Text('THE BESICS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'In This course we will go over the basics of using ',
                      style: TextStyle(height: 2.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Flutter Web for development. Topics will include',
                      style: TextStyle(height: 2.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Responsive Layout, Deploying, Font Changes, Hover ',
                      style: TextStyle(height: 2.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'functionality, Modals and more. ',
                      style: TextStyle(height: 2.0),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 80.0, 120.0, 330.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      alertbox(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                    child: const Center(
                      child: Text('join course'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> _builderShowDialog(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Expanded(
        child: AlertDialog(
          title: const Text('Confirmation Dialog'),
          titlePadding: const EdgeInsets.all(20.0),
          content: const Text('Do you want to join'),
          contentPadding: const EdgeInsets.all(20.0),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            )
          ],
        ),
      );
    },
  );
}
