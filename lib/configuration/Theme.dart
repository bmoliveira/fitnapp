import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ApplicationTheme {
  static ApplicationTheme current = ApplicationTheme();

  static const MaterialColor black = MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Colors.black12,
      100: Colors.black12,
      200: Colors.black26,
      300: Colors.black38,
      400: Colors.black45,
      500: Colors.black45,
      600: Colors.black54,
      700: Colors.black54,
      800: Colors.black87,
      900: Colors.black87,
    },
  );

  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    primaryColorDark: Colors.black,
    cursorColor: Colors.black,
    textSelectionColor: Colors.black,
    backgroundColor: Colors.white,
  );

  Color mainColor = black;
  Color mainDarkColor = black;

  Color textColor = Colors.black;
  Color accentTextColor = Colors.white;
  Color secondaryTextColor = Colors.black87;
}
