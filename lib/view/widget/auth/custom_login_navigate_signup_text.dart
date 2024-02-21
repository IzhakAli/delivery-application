import 'package:flutter/material.dart';

class CustomNavigatorBetweenAuthPages extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomNavigatorBetweenAuthPages(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
