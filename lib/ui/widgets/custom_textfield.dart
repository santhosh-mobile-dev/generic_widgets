import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textFieldController;
  final String labelText;
  final bool obscureText;
  final bool showPassword;
  final IconData iconData;
  final bool isShowIcon;
  final VoidCallback onPressed;
  CustomTextField(
      {this.textFieldController,
      this.labelText,
      this.obscureText,
      this.isShowIcon,
      this.showPassword,
      this.iconData,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool showPassword = false;
    return TextField(
      controller: textFieldController,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: isShowIcon
            ? IconButton(
                icon: Icon(
                  iconData,
                  color: Colors.blue,
                ),
                onPressed: onPressed,
              )
            : Container(
                width: 0,
                height: 0,
              ),
      ),
    );
  }
}
