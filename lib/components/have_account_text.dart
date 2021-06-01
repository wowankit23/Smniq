import 'package:flutter/material.dart';
import 'package:nectar/Utils/string_constants.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringConstants.alreadyHaveAccount,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            StringConstants.signIn,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
