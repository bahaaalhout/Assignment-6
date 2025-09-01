import 'package:first_app/data/freelancer.dart';
import 'package:first_app/widgets/rate_section.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.freelancer});
  final Freelancer freelancer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1D1F24),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Hero(
                tag: freelancer,
                child: Image.asset(freelancer.image, fit: BoxFit.fill),
              ),
            ),

            Text(
              freelancer.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            Text(
              freelancer.data,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            RateSection(rate: freelancer.rating),
          ],
        ),
      ),
    );
  }
}
