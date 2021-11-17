// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'const_colors.dart';


ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: kPrimaryOrange,
      scaffoldBackgroundColor: Colors.white,
      // ignore: prefer_const_constructors
      appBarTheme: AppBarTheme(),
      iconTheme: const IconThemeData(color: kContentColorLightTheme),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: kContentColorLightTheme),
      colorScheme: const ColorScheme.light(
        primary: kPrimaryOrange,
        secondary: kSecondaryDarkYellow,
        error: kErrorRedColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
        unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: kPrimaryOrange),
      ));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      primaryColor: kPrimaryOrange,
      scaffoldBackgroundColor: kContentColorLightTheme,
      appBarTheme: appBarTheme,
      iconTheme: const IconThemeData(color: kContentColorDarkTheme),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: Colors.grey),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryOrange,
        secondary: kSecondaryDarkYellow,
        error: kErrorRedColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kContentColorLightTheme,
        selectedItemColor: Colors.white70,
        unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: kPrimaryOrange),
      ));
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);