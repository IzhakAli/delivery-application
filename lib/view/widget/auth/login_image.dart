import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BGImageLogin extends StatelessWidget {
  final String assetName;
  final Widget child;
  const BGImageLogin({super.key, required this.child, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetName),
            alignment: Alignment.center, // Ensure the image is centered
            fit: BoxFit.cover, // Ensure the image covers the entire screen
          ),
        ),
        child: child);
  }
}
