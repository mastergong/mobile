import 'package:flutter/material.dart';
import '../../../../../core/themes/app_images.dart';

// ignore: non_constant_identifier_names
Widget Login_header() {
  return Container(
    //  width: constraints.maxWidth,
    //  height: constraints.maxWidth,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: Image.asset(
      AppImages.psucoop_logo,
      fit: BoxFit.cover,
    ),
  );
}
