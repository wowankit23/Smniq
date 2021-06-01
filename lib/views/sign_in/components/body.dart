import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:nectar/Utils/size_config.dart';
import 'package:nectar/Utils/string_constants.dart';
import 'package:nectar/components/no_account_text.dart';
import 'package:nectar/views/sign_in/components/sign_form.dart';
import 'package:nectar/views/sign_in/components/social_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
    return SafeArea(
      child: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.redAccent,
              height: 100,
              width: MediaQuery.of(context).size.width,
            ),
            clipper: WaveClipperOne(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              child: Container(
                color: Colors.redAccent,
                height: 80,
                width: MediaQuery.of(context).size.width,
              ),
              clipper: WaveClipperOne(reverse: true, flip: true),
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:
              EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Text(
                      StringConstants.welcomeBack,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      StringConstants.signinMessage,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    SignInForm(),
                    SizedBox(height: SizeConfig.screenHeight * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialCard(
                          icon: "assets/icons/google-icon.svg",
                          press: () {},
                        ),
                        SocialCard(
                          icon: "assets/icons/facebook-2.svg",
                          press: () {
                          },
                        ),
                        SocialCard(
                          icon: "assets/icons/twitter.svg",
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(40)),
                    NoAccountText(),
                  ],
                ),
              ),
            ),
          ),

        ],

      ),
    );
  }

  @override
  void dispose() {
  }
}