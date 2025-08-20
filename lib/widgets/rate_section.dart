import 'package:flutter/material.dart';

class RateSection extends StatelessWidget {
  const RateSection({super.key, required this.rate});
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff827BEB).withAlpha(50),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star_rounded, color: Color(0xff827BEB), weight: 12),
            Text('$rate', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
