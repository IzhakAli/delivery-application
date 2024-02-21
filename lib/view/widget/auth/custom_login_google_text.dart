import 'package:flutter/material.dart';

class CustomTextGoogleLogin extends StatelessWidget {
  const CustomTextGoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Sign in with ',
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
            TextSpan(
              text: 'G',
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
            TextSpan(
              text: 'g',
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
            TextSpan(
              text: 'l',
              style: TextStyle(color: Colors.green, fontSize: 22),
            ),
            TextSpan(
              text: 'e',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
