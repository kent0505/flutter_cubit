import 'package:flutter/material.dart';

class Themes {
  ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark();
  }
}
