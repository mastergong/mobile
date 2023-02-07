// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

// class GridMenuImge {
//   String imagePath;
//   String title;
//   Color color;
//   bool visible;
//   Function()? onTap;
//   GridMenuImge(
//       {required this.imagePath,
//       required this.title,
//       required this.color,
//       this.visible = true,
//       this.onTap});

//   Color get getcolor => color;
//   set setcolor(Color value) => color = value;

//   String get gettitle => title;
//   set settitle(String value) => title = value;

//   String get getimagePath => imagePath;
//   set setimagePath(String value) => imagePath = value;

//   bool get getvisible => visible;
//   set setvisible(bool value) => visible = value;

//   Function()? get getonTap => onTap;
//   set setonTap(Function()? value) => onTap = value;
// }

class GridMenu {
  IconData? imageIcon;
  String? imagePath;
  String title;
  Color color;
  bool visible;
  Function()? onTap;

  GridMenu(
      {required this.imageIcon,
      required this.imagePath,
      required this.title,
      required this.color,
      this.visible = true,
      this.onTap});

  Color get getcolor => color;
  set setcolor(Color value) => color = value;

  String get gettitle => title;
  set settitle(String value) => title = value;

  IconData get getimageIcon => imageIcon!;
  set setimageIcon(IconData value) => imageIcon = value;

  String get getimagePath => imagePath!;
  set setimagePath(String value) => imagePath = value;

  bool get getvisible => visible;
  set setvisible(bool value) => visible = value;

  Function()? get getonTap => onTap;
  set setonTap(Function()? value) => onTap = value;
}
