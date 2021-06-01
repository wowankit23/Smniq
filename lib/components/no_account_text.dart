import 'package:flutter/material.dart';
import 'package:nectar/Utils/string_constants.dart';
import 'package:nectar/views/sign_up/sign_up_screen.dart';
import '../utils/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringConstants.dontHaveAccount,
          style: TextStyle(fontSize: getProportionateScreenWidth(16), color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
          child: Text(
            StringConstants.signUp,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.blue[900],
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
