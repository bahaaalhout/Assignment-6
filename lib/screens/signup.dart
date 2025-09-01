import 'package:first_app/routes.dart';
import 'package:first_app/screens/home_screen.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/widgets/button.dart';
import 'package:first_app/widgets/text_input.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.deepPurple], //
            center: Alignment.center,
            radius: 2,
          ),
        ),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.deepPurple,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextInput(
                      hint: 'Name',
                      controller: _nameController,
                      validate: (name) {
                        if (name!.isEmpty) return 'Must Enter The Name';
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextInput(
                      hint: 'Email',
                      controller: _emailController,
                      validate: (email) {
                        if (!email!.contains('@') || !email.contains('.')) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextInput(
                      hint: 'Password',
                      controller: _passwordController,
                      isPass: true,
                      validate: (pass) {
                        if (pass!.length < 8) return 'Weak Passwrd';
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextInput(
                      hint: 'Confirm Password',
                      controller: _confirmPasswordController,
                      isPass: true,
                      validate: (pass) {
                        if (pass != _passwordController.text || pass!.isEmpty) {
                          return 'Not Match Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextInput(
                      hint: 'Phone',
                      controller: _phoneController,

                      validate: (phone) {
                        if (phone!.length != 10) return 'Invalid Phone Number';
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ButtonWidget(
                      onpressed: () async {
                        _login(context);
                      },
                      buttonChild: isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: Text('Already have an account?'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    if (_formkey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }
}
