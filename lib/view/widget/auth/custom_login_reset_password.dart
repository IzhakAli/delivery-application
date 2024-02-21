import 'package:flutter/material.dart';

class CustomResetPasswordTextLogin extends StatelessWidget {
  final void Function()? onPressed;
  const CustomResetPasswordTextLogin({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: const Text('Forgot password'),
      ),
    );
  }
}
