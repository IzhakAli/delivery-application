import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';


class CustomButtonLanguage extends StatelessWidget {
  final String $buttonName;
  final void Function()? onPressed;
  const CustomButtonLanguage({super.key, required this.$buttonName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary),
        child: Text($buttonName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    );
  }
}

