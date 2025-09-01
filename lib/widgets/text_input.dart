import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.hint,
    this.isPass = false,
    required this.controller,
    this.validate,
  });
  final String hint;
  final bool isPass;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: validate,
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          hint: Text(hint),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
