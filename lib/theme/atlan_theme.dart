import 'package:flutter/material.dart';

class AtlanTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.indigo,
      accentColor: Colors.pinkAccent,
      fontFamily: 'NunitoSans',
      buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        buttonColor: Colors.pinkAccent,
        highlightColor: Colors.indigo
      )
    );
  }
}