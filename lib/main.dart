import 'package:flutter/material.dart';
import 'package:practice_one/presentation/screens/home_page.dart';

void main() {
  runApp(shirtcart());
}

class shirtcart extends StatelessWidget {
  const shirtcart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_page(),
    );
  }
}
