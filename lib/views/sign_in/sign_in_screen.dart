import 'package:flutter/material.dart';
import 'package:nectar/Utils/size_config.dart';
import 'package:nectar/Utils/string_constants.dart';

import 'components/body.dart';
class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(StringConstants.signIn),
      ),
      body: Body(),
    );
  }
}