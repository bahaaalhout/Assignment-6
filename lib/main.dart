import 'package:first_app/Counter%20App/counter_bloc_screen.dart';
import 'package:first_app/bloc_observer.dart';
import 'package:first_app/routes.dart';

import 'package:first_app/screens/auth/login.dart';
import 'package:first_app/screens/auth/signup.dart';
import 'package:first_app/Counter%20App/counter_cubit_screen.dart';
import 'package:first_app/shop/presentation/provider/product_provider.dart';
import 'package:first_app/todo/data/note_shared_db.dart';
import 'package:first_app/todo/data/note_sqllite_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteSharedDb.init();
  await NotesSqliteDb.init();
  Bloc.observer = MyBlocObserver();

  // var email = prefs.getString(LoginScreen.userCred);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider()..fetchData(),
      // create: (context) => NoteProvider()..readNote(),
      child: MaterialApp(
        routes: {
          // Routes.home: (context) => HomeScreen(),
          Routes.signup: (context) => SignupScreen(),
          Routes.login: (context) => LoginScreen(),
          // Routes.main: (context) => MyApp(),
          // Routes.details: (context) => DetailsScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: CounterBlocScreen(),
      ),
    );
  }
}
