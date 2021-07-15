import 'package:flutter/material.dart';

/// AppTextStyle format as follows:
/// [fontWeight][fontSize][colorName][opacity]
/// Example: bold18White05
///
class AppTextStyle {
  static TextStyle title = TextStyle(
    fontSize: 30,
    color: Colors.yellow[800],
  );

  static TextStyle body = TextStyle(
    fontSize: 20,
    color: Colors.yellow[800],
  );
}
