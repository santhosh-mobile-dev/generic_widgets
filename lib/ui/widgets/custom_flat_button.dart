import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final VoidCallback onClick;

  CustomFlatButton({this.text,this.color,this.fontWeight,this.onClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text(text,style: TextStyle(fontSize: 18.0,fontWeight: fontWeight),),
        onPressed: onClick,
        textColor: color,
      ),
    );
  }
}