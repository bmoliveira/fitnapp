import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ApplicationTheme {
  static ApplicationTheme current = ApplicationTheme();

  static ThemeData themeData = ThemeData(
    primarySwatch: ApplicationTheme.current.mainColor,
    accentColor: ApplicationTheme.current.accentColor
  );

  Color mainColor = Colors.blue[500];
  Color mainDarkColor = Colors.blue[900];
  Color accentColor = Colors.white;

  Color textColor = Colors.black;
  Color secondaryTextColor = Colors.black38;
}
