import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstant {
  // Field
  static Color primary = Color.fromARGB(255, 87, 0, 114);
  static Color dark = Colors.black;
  static Color active = Color.fromARGB(255, 206, 0, 0);

  // Method

  BoxDecoration bgbox() {
    return BoxDecoration(
      gradient: RadialGradient(
        radius: 1.5,
        center: Alignment(-0.3, -0.3),
        colors: [Color.fromARGB(255, 219, 99, 235), primary],
      ),
    );
  }

  TextStyle h1Style() {
    return GoogleFonts.mali(
      textStyle:
          TextStyle(fontSize: 36, color: dark, fontWeight: FontWeight.bold),
    );
  }

  TextStyle h2Style() {
    return GoogleFonts.mali(
        textStyle: TextStyle(
      fontSize: 16,
      color: dark,
      fontWeight: FontWeight.w700,
    ));
  }

  TextStyle h3Style() {
    return GoogleFonts.mali(
      textStyle: TextStyle(
        fontSize: 16,
        color: dark,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  TextStyle h3active() {
    return GoogleFonts.mali(
      textStyle: TextStyle(
        fontSize: 14,
        color: active,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
