import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFEA3C12),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Oleo Script',
        fontSize: 22.0,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Rowdies',
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Oleo Script',
        fontSize: 36.0,
        fontWeight: FontWeight.w200,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Rowdies',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: const Color(0xFFFFBE79))
        .copyWith(background: const Color(0xFFEA9937)),
  );
}
