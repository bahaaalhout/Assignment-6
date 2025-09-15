import 'package:first_app/routes.dart';
import 'package:first_app/widgets/button.dart';
import 'package:first_app/widgets/text_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.deepOrange], //
            center: Alignment.center,
            radius: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 50),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.deepOrange,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextInput(
                    hint: 'Email',
                    controller: _emailController,
                    validate: (email) {
                      if (!email!.contains('@') && !email.contains('.')) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextInput(
                    hint: 'Password',
                    controller: _passController,
                    isPass: true,
                    validate: (pass) {
                      if (pass!.length < 8) return 'Weak Passwrd';
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ButtonWidget(
                    onpressed: () {
                      _login(context);
                    },
                    buttonChild: isLoading
                        ? CircularProgressIndicator()
                        : Text('Login', style: TextStyle(color: Colors.white)),
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.signup);
              },
              child: Text('You dont have accound?'),
            ),
          ],
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }
}

void showSnackBar(String bio, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(bio)));
}
