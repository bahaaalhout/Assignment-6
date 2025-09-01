import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onpressed,
    required this.color,
    required this.buttonChild,
  });
  final void Function() onpressed;
  final Color color;
  final Widget buttonChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Custom border radius
          ),
        ),
        child: buttonChild,
      ),
    );
  }
}
