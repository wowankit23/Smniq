import 'package:flutter/material.dart';
import 'package:nectar/splash/splash_screen.dart';

import 'views/dashboard.dart';
import 'views/forgot_password/forgot_password_screen.dart';
import 'views/sign_in/sign_in_screen.dart';
import 'views/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  Dashboard.routeName: (context) => Dashboard(),
};
