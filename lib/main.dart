import 'package:first_app/routes.dart';

import 'package:first_app/screens/home_screen.dart';
import 'package:first_app/screens/auth/login.dart';
import 'package:first_app/screens/auth/signup.dart';
import 'package:first_app/screens/note_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  var prefs = await SharedPreferences.getInstance();
  var email = prefs.getString(LoginScreen.userCred);
  runApp(MyApp(isLoggedin: email != null, email: email ?? 'Guset'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedin, required this.email});
  final bool isLoggedin;
  final String email;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // Routes.home: (context) => HomeScreen(),
        Routes.signup: (context) => SignupScreen(),
        Routes.login: (context) => LoginScreen(),
        // Routes.main: (context) => MyApp(),
        // Routes.details: (context) => DetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: isLoggedin ? NoteScreen() : LoginScreen(),
    );
  }
}
