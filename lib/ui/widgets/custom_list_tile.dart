import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData iconData;
  final String text;

  CustomListTile({this.iconData, this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.deepPurple,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 18.0),
      ),
      onTap: () {},
    );
  }
}
