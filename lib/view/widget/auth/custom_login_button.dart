import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonLogin extends StatelessWidget {
  final String buttonName;
  final void Function()? onPressed;
  const CustomButtonLogin(
      {super.key, required this.buttonName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.60, // 85% of screen width
      height: Get.height * 0.07, // 9% of screen height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
