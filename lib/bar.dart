import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({
    super.key,
    required this.name,
    required this.buttonName,
    required this.buttonFunction,
  });
  final String name;
  final String buttonName;
  final void Function() buttonFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 38,
          padding: EdgeInsets.only(left: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xffC2D7F2), Colors.white]),
          ),
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        TextButton(
          onPressed: buttonFunction,
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
