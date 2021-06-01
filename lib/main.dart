import 'package:nectar/routes.dart';
import 'package:nectar/splash/splash_screen.dart';
import 'package:nectar/views/appointment_booking.dart';
import 'package:nectar/views/dashboard.dart';
import 'package:flutter/material.dart';

import 'Utils/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Doctor Appointment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.red,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
