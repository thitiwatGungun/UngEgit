import 'package:flutter/material.dart';

class MyConstant {
  // Field
  static Color primary = Color.fromARGB(255, 177, 0, 0);
  static Color dark = Colors.black;

  // Method

  BoxDecoration bgbox() {
    return BoxDecoration(
      gradient: RadialGradient(radius: 1.5,
        center: Alignment(-0.3, -0.3),
        colors: [Colors.yellow, primary],
      ),
    );
  }

  TextStyle h1Style() {
    return TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      fontSize: 18,
      color: dark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      fontSize: 10,
      color: dark,
      fontWeight: FontWeight.normal,
    );
  }
}
