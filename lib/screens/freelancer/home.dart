import 'package:first_app/data/freelancer.dart';
import 'package:first_app/widgets/ads.dart';
import 'package:first_app/widgets/bar.dart';
import 'package:first_app/widgets/freelance_info.dart';
import 'package:first_app/widgets/top_rated.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final List<Freelancer> freelancer = [
    Freelancer(
      name: 'Wade Warren',
      data: 'Beautician',
      image: 'assets/1.png',
      rating: 4.9,
    ),
    Freelancer(
      name: 'Jane Cooper',
      data: 'Makeup Artist',
      image: 'assets/2.png',
      rating: 4.8,
    ),
    Freelancer(
      name: 'Esther Howard',
      data: 'Hairstylist',
      image: 'assets/3.png',
      rating: 4.7,
    ),
    Freelancer(
      name: 'Esther Howard',
      data: 'Hairstylist',
      image: 'assets/4.png',
      rating: 4.7,
    ),
    Freelancer(
      name: 'Esther Howard',
      data: 'Hairstylist',
      image: 'assets/4.png',
      rating: 4.7,
    ),
    Freelancer(
      name: 'Esther Howard',
      data: 'Hairstylist',
      image: 'assets/4.png',
      rating: 4.7,
    ),
    Freelancer(
      name: 'Esther Howard',
      data: 'Hairstylist',
      image: 'assets/4.png',
      rating: 4.7,
    ),
    Freelancer(
      name: 'Esther Howard',
      data: 'Hairstylist',
      image: 'assets/4.png',
      rating: 4.7,
    ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                        ),
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
            AdsWidget(),
            SizedBox(height: 20),
            Bar(
              name: 'Top Rated Freelances',
              buttonName: 'View All',
              buttonFunction: () {},
            ),
            SizedBox(height: 20),
            Container(
              height: 140,
              alignment: Alignment.topLeft,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: freelancer.length,
                itemBuilder: (context, index) =>
                    TopRated(freelancer: freelancer[index]),
              ),
            ),
            SizedBox(height: 20),
            Bar(
              name: 'Top Services',
              buttonName: 'View All',
              buttonFunction: () {},
            ),
            SizedBox(height: 20),
            FreelanceInfo(
              image: 'assets/image1.png',
              profilePic: 'assets/profilepic.png',
              name: 'Miss Zachary Will',
              onpressed: () {},
              bio: 'Doloribus saepe aut necessit qui non qui.',
              type: 'Beautician',
              rate: 4.7,
            ),
            FreelanceInfo(
              image: 'assets/image2.png',
              profilePic: 'assets/profilepic.png',
              name: 'Miss Zachary Will',
              onpressed: () {},
              bio: 'Doloribus saepe aut necessit qui non qui.',
              type: 'Beautician',
              rate: 4.9,
            ),
            FreelanceInfo(
              image: 'assets/image3.png',
              profilePic: 'assets/profilepic.png',
              name: 'Miss Zachary Will',
              onpressed: () {},
              bio: 'Doloribus saepe aut necessit qui non qui.',
              type: 'Beautician',
              rate: 4.5,
            ),
          ],
        ),
      ),
    );
  }
}
