import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
  appBarTheme: const AppBarTheme(
      color: AppColor.backGroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.primary,
          fontSize: 24,
          fontFamily: 'Poppins')),
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    // Display Large
    displayLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.black),
    // Display Medium
    displayMedium: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    // Display Small
    displaySmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.black),
    // Body Large
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 2,
      color: AppColor.grey,
    ),
    // Body Medium
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 2,
      color: AppColor.grey,
    ),
    // Body Small
    bodySmall: TextStyle(
      fontSize: 12,
      height: 2,
      color: AppColor.grey,
    ),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
  appBarTheme: const AppBarTheme(
      color: AppColor.backGroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.primary,
          fontSize: 24,
          fontFamily: 'Cairo')),
  fontFamily: 'Cairo',
  textTheme: const TextTheme(
    // Display Large
    displayLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.black),
    // Display Medium
    displayMedium: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black),
    // Display Small
    displaySmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.black),
    // Body Large
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 2,
      color: AppColor.grey,
    ),
    // Body Medium
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 2,
      color: AppColor.grey,
    ),
    // Body Small
    bodySmall: TextStyle(
      fontSize: 12,
      height: 2,
      color: AppColor.grey,
    ),
  ),
);
