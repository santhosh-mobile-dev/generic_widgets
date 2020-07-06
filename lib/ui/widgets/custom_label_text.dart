import 'package:flutter/material.dart';

class CustomLabelText extends StatelessWidget {
  final String text;

  CustomLabelText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
