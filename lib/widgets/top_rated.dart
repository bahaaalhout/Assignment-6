import 'package:first_app/data/freelancer.dart';

import 'package:first_app/screens/freelancer/details.dart';
import 'package:first_app/widgets/rate_section.dart';
import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.freelancer});
  final Freelancer freelancer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(freelancer: freelancer),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topLeft,
          children: [
            Hero(
              tag: freelancer,
              child: CircleAvatar(
                maxRadius: 35,
                backgroundImage: AssetImage(freelancer.image),
              ),
            ),
            Positioned(
              top: 60,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(freelancer.name, style: TextStyle(fontSize: 12)),
                    Text(freelancer.data, style: TextStyle(fontSize: 13)),

                    RateSection(rate: freelancer.rating),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
