import 'package:first_app/freelancer/auth/auth_sharedpref.dart';
import 'package:first_app/freelancer/freelance_cubit.dart';
import 'package:first_app/freelancer/freelancer_states.dart';
import 'package:first_app/freelancer/home.dart';
import 'package:first_app/routes.dart';
import 'package:first_app/widgets/button.dart';
import 'package:first_app/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<FreelanceCubit, FreelancerStates>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          print(state.email);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  // HomeScreen(email: _emailController.text),
                  Home(email: state.email),
            ),
          );
        } else if (state is AuthErrorState) {
          showSnackBar(state.error, context);
        }
      },
      child: Scaffold(
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
                    BlocBuilder<FreelanceCubit, FreelancerStates>(
                      builder: (context, state) => ButtonWidget(
                        onpressed: () {
                          _login(context);
                        },
                        buttonChild: state is AuthLoadingState
                            ? CircularProgressIndicator()
                            : Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                        color: Colors.deepOrange,
                      ),
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
      ),
    );
  }

  _login(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      // checkLogin(_emailController.text);
      String email = _emailController.text;
      String password = _passController.text;
      BlocProvider.of<FreelanceCubit>(context).loginMethod(email, password);
      AuthSharedpref.login(email);
    }
  }

  // checkLogin(String email) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.setString(LoginScreen.userCred, email);
  // }
}

void showSnackBar(String bio, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(bio)));
}
