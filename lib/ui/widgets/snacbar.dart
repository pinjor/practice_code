import 'package:flutter/material.dart';

void showsnackbarmessage(context, String message, [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green));
}
