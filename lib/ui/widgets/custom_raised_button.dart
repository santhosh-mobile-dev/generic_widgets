import 'package:flutter/material.dart';


class CustomRaisedButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  CustomRaisedButton({this.text,this.onClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text(text),
          onPressed:onClick,
          color: Colors.blue,
        textColor: Colors.white,

      ),
    );
  }

}