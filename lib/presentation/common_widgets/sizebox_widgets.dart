import 'package:flutter/material.dart';

Widget sizebox({double? width, double? height, Widget? widget}) {
  return SizedBox(
    width: width ?? 5,
    height: height,
    child: widget,
  );
}

Widget sizeboxWidth(double? width) {
  return SizedBox(width: width ?? 5);
}

Widget sizeboxHeight(double? height) {
  return SizedBox(height: height ?? 5);
}

Widget sizeboxHeight10() {
  return const SizedBox(height: 10);
}

Widget sizeboxHeight50() {
  return const SizedBox(height: 50);
}
