import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String labelText;
  final Icon prefixIcon;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  const CustomTextFormAuth({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    required this.myController,
    required this.valid,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      obscureText: obscureText == null || obscureText == false ? false : true,
      keyboardType: keyboardType,
      validator: valid,
      controller: myController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          prefixIcon: prefixIcon,
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 8, color: Colors.white),
          ),
          suffixIcon: suffixIcon),
    );
  }
}
