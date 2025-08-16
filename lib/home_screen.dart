import 'package:first_app/bar.dart';
import 'package:first_app/top_rated.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search...",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Image.asset('assets/sort.png', fit: BoxFit.fill),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        const Color.fromARGB(255, 116, 177, 227),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Todays Deal',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '50% OFF',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Et provident eos est dolore. Eum libero eligendi molestias aut et quibusdam aspernatur.',
                              softWrap: true,

                              style: TextStyle(
                                color: Color(0xFF5C6F81),
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 150,
                              height: 35,
                              color: Colors.black,
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'BUY IT NOW',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/weman.png'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Bar(
                name: 'Top Rated Freelances',
                buttonName: 'View All',
                buttonFunction: () {},
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TopRated(
                    name: 'Wade Warren',
                    data: 'Beautician',
                    image: 'assets/1.png',
                    rate: 4.9,
                  ),
                  TopRated(
                    name: 'Jane Cooper',
                    data: 'Makeup Artist',
                    image: 'assets/2.png',
                    rate: 4.8,
                  ),
                  TopRated(
                    name: 'Esther Howard',
                    data: 'Hairstylist',
                    image: 'assets/3.png',
                    rate: 4.7,
                  ),
                  TopRated(
                    name: 'Esther Howard',
                    data: 'Hairstylist',
                    image: 'assets/4.png',
                    rate: 4.7,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Bar(
                name: 'Top Services',
                buttonName: 'View All',
                buttonFunction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
