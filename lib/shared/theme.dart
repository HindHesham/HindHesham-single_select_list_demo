import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      background: Color(0xffF5F5F5),
      primaryContainer: Colors.white,
      onPrimaryContainer: Color.fromARGB(88, 232, 232, 232),
      primary: Color(0xff323333),
      secondary: Color(0xff707070),
      onSecondary: Color(0xffF5F5F5),
      tertiary: Color(0xff4052EF),
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      primaryContainer: Colors.grey.shade900,
      onPrimaryContainer: const Color(0xff272727),
      primary: Colors.white,
      secondary: const Color(0xffA6A6A6),
      onSecondary: const Color(0xff404040),
      tertiary: const Color(0xffaeb7fc),
    ));
