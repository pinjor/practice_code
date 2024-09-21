import 'package:flutter/material.dart';
import 'package:practice_one/presentation/screens/productListScreen.dart';

class Crud_app extends StatelessWidget {
  const Crud_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: productListScreen(),
    );
  }
}
