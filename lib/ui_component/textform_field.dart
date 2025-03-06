import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final bool isPassword;
  final IconData? prefixIcon;
  final IconData? suffixicon;
  final Function(String)? onChanged;
  final String? labelText;

  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.errorText,
      this.isPassword = false,
      this.prefixIcon,
      this.suffixicon,
      this.onChanged,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixicon,color: Colors.teal),
        prefixIcon: Icon(prefixIcon, color: Colors.teal),
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
