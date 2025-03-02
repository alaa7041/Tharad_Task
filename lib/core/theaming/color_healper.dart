import 'package:flutter/material.dart';

abstract class ColorsHelper {
  static const Color lighterGreen = Color(0xffF4F7F6);
  static const Color darkGreen = Color(0xff265355);
  static const Color lightGray = Color(0xff998C8C);


}

  Gradient gradientAppColorList = LinearGradient(
    colors: [
      Color(0xFF5CC7A3),
      Color(0xFF265355),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );