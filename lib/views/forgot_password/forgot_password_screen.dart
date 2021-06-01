
import 'package:flutter/material.dart';
import 'package:nectar/Utils/string_constants.dart';
import 'package:nectar/views/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(StringConstants.forgotPassword),
      ),
      body: Body(),
    );
  }
}
