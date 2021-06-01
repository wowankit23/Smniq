import 'package:flutter/material.dart';
import 'package:nectar/Utils/size_config.dart';

import 'components/body.dart';

class SplashScreen extends StatelessWidget {

  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it to initialize MediaQuery
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
