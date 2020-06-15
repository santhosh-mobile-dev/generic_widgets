import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genericwidgetapp/custom_message.dart';
import 'package:genericwidgetapp/ui/widgets/custom_label_text.dart';

import '../widgets/custom_raised_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/heading.dart';
import '../widgets/custom_flat_button.dart';
import 'package:genericwidgetapp/ui/screen/login.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = false;
  bool obscuredText = true;

  Widget sizedBoxH20() {
    return SizedBox(
      height: 20.0,
    );
  }

  Widget sizedBoxH100() {
    return SizedBox(
      height: 100.0,
    );
  }

  Widget sizedBoxH50() {
    return SizedBox(
      height: 50.0,
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

  Widget body(BuildContext context) {
    return createAccountUI(context);
  }

  Widget createAccountUI(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Heading(
            text: CustomMessages.createAccount,
          ),
          sizedBoxH50(),
          CustomLabelText(
            text: CustomMessages.name,
          ),
          CustomTextField(
            textFieldController: nameController,
            obscureText: false,
            isShowIcon: false,
          ),
          sizedBoxH20(),
          CustomLabelText(
            text: CustomMessages.emailAddress,
          ),
          CustomTextField(
            textFieldController: emailController,
            obscureText: false,
            isShowIcon: false,
          ),
          sizedBoxH20(),
          CustomLabelText(
            text: CustomMessages.password,
          ),
          CustomTextField(
            textFieldController: passwordController,
            obscureText: obscuredText,
            isShowIcon: true,
            iconData: showPassword ? Icons.visibility : Icons.visibility_off,
            showPassword: showPassword,
            onPressed: passwordVisibility,
          ),
          sizedBoxH20(),
          CustomRaisedButton(
            text: CustomMessages.createAccount,
            onClick: createAccount,
          ),
          sizedBoxH100(),
          Center(
              child: Heading(
            text: CustomMessages.alreadyHaveAnAccount,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          )),
          sizedBoxH20(),
          CustomFlatButton(
            text: CustomMessages.loginText,
            onClick: login,
            color: Colors.deepPurple,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  void createAccount() {}

  void login() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }
}
