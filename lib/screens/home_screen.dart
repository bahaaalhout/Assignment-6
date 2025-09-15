import 'package:first_app/screens/book/book_screen.dart';
import 'package:first_app/screens/freelancer/home.dart';
import 'package:first_app/screens/product/product_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> data = [
    ProductScreen(),
    BookScreen(),
    Text('Profile'),
    Text('Profile'),
  ];
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
            label: 'Search',
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
}
