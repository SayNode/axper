import 'package:flutter/material.dart';

class ThemeAxper {
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color primaryRed = Color(0xFFFF0012);
  static const Color textBlue = Color.fromARGB(255, 215, 215, 238);

  static const Color brightBrown = Color(0xFFe7d2c6);
  static const Color darkBrown = Color(0xFF2d1405);

  static const Color primaryBlue = Color(0xFF14145E);

  static const primaryColorBright = Color.fromARGB(255, 51, 51, 179);
  static const primaryColorDark = Color.fromARGB(255, 12, 12, 56);

  static const backgroundColor = Color(0xFF3E486B);
  static const backgroundColorDark = Color(0xFF282F49);
}

Map<int, Color> primaryColorShades = {
  50: const Color.fromRGBO(103, 151, 254, .1),
  100: const Color.fromRGBO(103, 151, 254, .2),
  200: const Color.fromRGBO(103, 151, 254, .3),
  300: const Color.fromRGBO(103, 151, 254, .4),
  400: const Color.fromRGBO(103, 151, 254, .5),
  500: const Color.fromRGBO(103, 151, 254, .6),
  600: const Color.fromRGBO(103, 151, 254, .7),
  700: const Color.fromRGBO(103, 151, 254, .8),
  800: const Color.fromRGBO(103, 151, 254, .9),
  900: const Color.fromRGBO(103, 151, 254, 1)
};

MaterialColor primaryColor() {
  return MaterialColor(0xFF56290c, primaryColorShades);
}
