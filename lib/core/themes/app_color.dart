// login page ----------------------------------------------------------------

// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppColor {
  static Color primaryColor = const Color(0xFF1C3E66);
  static Color secondaryColor = const Color.fromARGB(255, 3, 8, 104);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color blackGrey = const Color.fromARGB(255, 39, 39, 39);
  static Color backgroundBlack = const Color.fromARGB(255, 37, 37, 37);
  static Color backgroundWhite = const Color.fromARGB(255, 255, 255, 255);
  static Color backgroundGray = const Color.fromARGB(255, 240, 240, 240);
  static Color transparent = Colors.transparent;
  static Color error = const Color.fromARGB(255, 226, 54, 54);

  static Color loginBtn = HexColor.fromHex("#CF835D");
  static Color contactBtn = HexColor.fromHex("#DD9E7E");
  static Color button = HexColor.fromHex("#F5E565");
  static Color reqOtp = HexColor.fromHex("#6B6B76");
  static Color pinDigit = HexColor.fromHex("#D99C7D");
  static Color complete = HexColor.fromHex("#71B48D");
  static Color header = HexColor.fromHex("#CF835D");
  static Color saveBtn = HexColor.fromHex("#6B6B76");
  static Color statusbar = HexColor.fromHex("#9b5632");

  static MaterialColor primarySwatch = const MaterialColor(
    0xFF1C3E66,
    {
      50: Color(0xFF8e9fb3),
      100: Color(0xFF778ba3),
      200: Color(0xFF607894),
      300: Color(0xFF496585),
      400: Color(0xFF335175),
      500: Color(0xFF1C3E66),
      600: Color(0xFF19385c),
      700: Color(0xFF163252),
      800: Color(0xFF142b47),
      900: Color(0xFF11253d),
    },
  );
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
