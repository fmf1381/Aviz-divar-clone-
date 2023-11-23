import 'package:aviz/constants/custome_colors.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData ElevatedBottomTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColors.baseColor,
      minimumSize: const Size.fromHeight(40),
      textStyle: const TextStyle(fontSize: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

OutlinedButtonThemeData OutlineBottomTheme() {
  return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    minimumSize: const Size(100, 40),
    textStyle: const TextStyle(fontSize: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    side: const BorderSide(width: 1, color: CustomColors.baseColor),
  ));
}
