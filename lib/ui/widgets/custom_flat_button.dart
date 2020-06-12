import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  CustomFlatButton({this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text(text),
        onPressed: onClick,
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
