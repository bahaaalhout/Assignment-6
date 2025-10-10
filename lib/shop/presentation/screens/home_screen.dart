import 'package:first_app/screens/actors/actors_screen.dart';
import 'package:first_app/screens/book/book_screen.dart';
import 'package:first_app/shop/presentation/screens/cart_screen.dart';
import 'package:first_app/shop/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.email});
  final String? email;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> data = [
    ProductScreen(),
    BookScreen(),
    CartScreen(),
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
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart_sharp),
            backgroundColor: Color(0xff1D1F24),
            label: 'Cart',
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
