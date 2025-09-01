import 'package:first_app/screens/home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> data = [
    Home(),
    Text('Explore'),
    Text('Search'),
    Text('Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, weight: 25),
        title: Image.asset('assets/logo.png'),
        actions: [
          SizedBox(width: 12),
          Image.asset('assets/bell.png'),
          SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/cart.png'),
          ),
          SizedBox(width: 12),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff827BEB),
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
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            backgroundColor: Color(0xff1D1F24),
            label: 'Explore',
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
            label: 'Profile',
          ),
        ],
      ),
      body: data[index],
    );
  }
}
