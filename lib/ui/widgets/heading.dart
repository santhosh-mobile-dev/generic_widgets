import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  Heading({this.text, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: fontSize ?? 24.0,
            fontWeight: fontWeight ?? FontWeight.w500));
  }
}
