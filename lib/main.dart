import 'package:first_app/routes.dart';

import 'package:first_app/screens/home_screen.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.signup: (context) => SignupScreen(),
        Routes.login: (context) => LoginScreen(),
        Routes.main: (context) => MyApp(),
        // Routes.details: (context) => DetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
