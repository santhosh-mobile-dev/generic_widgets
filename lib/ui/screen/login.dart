import 'package:flutter/material.dart';
import 'package:genericwidgetapp/ui/screen/home_page.dart';
import 'package:genericwidgetapp/ui/widgets/custom_flat_button.dart';
import 'package:genericwidgetapp/ui/widgets/custom_raised_button.dart';
import 'package:genericwidgetapp/ui/widgets/custom_textfield.dart';
import 'package:genericwidgetapp/ui/widgets/heading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = false;
  bool obscuredText = true;

  Widget body(BuildContext context) {
    return loginUI(context);
  }

  Widget sizedBoxH16() {
    return SizedBox(
      height: 16.0,
    );
  }

  Widget sizedBoxH94() {
    return SizedBox(
      height: 94.0,
    );
  }

  Widget sizedBoxH160() {
    return SizedBox(
      height: 160.0,
    );
  }

  void passwordVisibility() {
    if (showPassword) {
      showPassword = false;
      obscuredText = true;
      setState(() {});
    } else {
      showPassword = true;
      obscuredText = false;
      setState(() {});
    }
  }

  void login() {
    //TODO :: Complete this accordingly
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Widget loginUI(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Heading(
            text: "Login",
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
          ),
          sizedBoxH94(),
          CustomTextField(
            textFieldController: emailController,
            labelText: "Email Address",
            obscureText: false,
            isShowIcon: false,
          ),
          sizedBoxH16(),
          CustomTextField(
            textFieldController: passwordController,
            labelText: "Password",
            obscureText: obscuredText,
            isShowIcon: true,
            iconData: showPassword ? Icons.visibility_off : Icons.visibility,
            showPassword: showPassword,
            onPressed: passwordVisibility,
          ),
          sizedBoxH16(),
          CustomRaisedButton(
            text: "Login",
            onClick: login,
          ),
          sizedBoxH16(),
          CustomFlatButton(
            text: "Forgot Password?",
            onClick: () {},
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          sizedBoxH160(),
          Center(
              child: Heading(
            text: "Don't have an account?",
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          )),
          sizedBoxH16(),
          CustomFlatButton(
            text: "Create Account",
            onClick: () {},
            color: Colors.deepPurple,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }
}
