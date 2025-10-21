import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/bloc_observer.dart';
import 'package:first_app/firebase_options.dart';
import 'package:first_app/freelancer/auth/auth_sharedpref.dart';
import 'package:first_app/freelancer/freelance_cubit.dart';
import 'package:first_app/freelancer/home.dart';
import 'package:first_app/routes.dart';

import 'package:first_app/freelancer/auth/login_using_local.dart';
import 'package:first_app/freelancer/auth/signup.dart';
import 'package:first_app/todo/data/note_shared_db.dart';
import 'package:first_app/todo/data/note_sqllite_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await NoteSharedDb.init();
  // await NotesSqliteDb.init();
  // await AuthSharedpref.init();
  Bloc.observer = MyBlocObserver();

  // var email = prefs.getString(LoginScreen.userCred);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final prefs = AuthSharedpref.prefs;
    return BlocProvider<FreelanceCubit>(
      create: (context) => FreelanceCubit()..isLoggedIn(),
      // create: (context) => ProductProvider()..fetchData(),
      // create: (context) => NoteProvider()..readNote(),
      child: MaterialApp(
        routes: {
          Routes.home: (context) => Home(),
          Routes.signup: (context) => SignupScreen(),
          Routes.login: (context) => LoginScreen(),
          // Routes.main: (context) => MyApp(),
          // Routes.details: (context) => DetailsScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
