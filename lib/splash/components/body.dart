import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nectar/Utils/size_config.dart';
import 'package:nectar/Utils/string_constants.dart';
import 'package:nectar/views/sign_in/sign_in_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4), (){
      //Navigator.pushNamed(context, SignInScreen.routeName);
      Navigator.popAndPushNamed(context, SignInScreen.routeName);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child:  Image.network(
                  'https://cdn.iconscout.com/icon/premium/png-256-thumb/doctor-appointment-1981618-1676696.png',
                  width: 50.0,
                )),
            SizedBox(height: getProportionateScreenHeight(30)),
            Text(StringConstants.splashTagline, style: TextStyle(fontSize:20, ),)
          ],
        ),

      ),
    );
  }

}
