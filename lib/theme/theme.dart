import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  backgroundColor: AppColors.backgroundColor,
  fontFamily: GoogleFonts.almarai().fontFamily,
  appBarTheme:
      const AppBarTheme(backgroundColor: AppColors.primaryColor, elevation: 0),
  indicatorColor: AppColors.accentColor,
  // button style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      ),
    ),
  ),
  // input decoration style
  inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: AppColors.primaryColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
      ),
      border: OutlineInputBorder(),
      fillColor: AppColors.black,
      focusColor: AppColors.primaryColor),
);
