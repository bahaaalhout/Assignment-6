import 'package:first_app/screens/actors/actors_screen.dart';
import 'package:first_app/screens/auth/login.dart';
import 'package:first_app/screens/book/book_screen.dart';
import 'package:first_app/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.email});
  final String email;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> data = [
    ProductScreen(),
    BookScreen(),
    Text('widget.email'),
    ActorScreen(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   email = getEmail();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff827BEB),
        backgroundColor: Color(0xff1D1F24),
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled),
            backgroundColor: Color(0xff1D1F24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            activeIcon: Icon(Icons.menu_book),
            backgroundColor: Color(0xff1D1F24),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            activeIcon: Icon(Icons.search_rounded),
            backgroundColor: Color(0xff1D1F24),
            label: widget.email,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            backgroundColor: Color(0xff1D1F24),
            label: 'Actors',
          ),
        ],
      ),
      body: data[index],
    );
  }

  // getEmail() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var email = prefs.getString(LoginScreen.userCred);
  //   return email;
  // }
}
