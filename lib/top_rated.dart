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
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(image),
            Container(
              color: Colors.white,
              child: Text(name, style: TextStyle(fontSize: 12)),
            ),
          ],
        ),

        Text(data, style: TextStyle(fontSize: 13)),

        Row(children: [Icon(Icons.star), Text('$rate')]),
      ],
    );
  }
}
