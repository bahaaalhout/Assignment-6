import 'package:first_app/widgets/rate_section.dart';
import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  const TopRated({
    super.key,
    required this.name,
    required this.data,
    required this.image,
    required this.rate,
  });
  final String name;
  final String data;
  final String image;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(image),
        Positioned(
          top: 55,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(name, style: TextStyle(fontSize: 12)),
                Text(data, style: TextStyle(fontSize: 13)),

                RateSection(rate: rate),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
