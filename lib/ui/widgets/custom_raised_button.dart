import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  CustomRaisedButton({this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          padding: EdgeInsets.all(0.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.84,
            height: 50,
            child: Center(
                child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple],
              ),
            ),
          ),
          onPressed: onClick,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
