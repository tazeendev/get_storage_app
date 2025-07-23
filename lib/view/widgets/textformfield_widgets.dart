import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType textInputType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.purple.shade300),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      ),
    );
  }
}
