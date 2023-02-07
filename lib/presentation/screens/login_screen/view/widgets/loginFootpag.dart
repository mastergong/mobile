import 'package:flutter/material.dart';

import '../../../../../core/themes/app_color.dart';
import '../../../../../core/config/app_config.dart' as base;
import '../../../../../core/themes/app_icon.dart';

// ignore: non_constant_identifier_names
Widget Login_footpagmenu() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        footpag_menuSub(ic: AppIcons.envelope, fuc: () => print("cleck 1 ")),
        footpag_menuSub(ic: AppIcons.phone, fuc: () => print("cleck 2 ")),
        footpag_menuSub(ic: AppIcons.line, fuc: () => print("cleck 3 "))
      ]),
      Text(
        'เวอร์ชั้น ${base.AppConfig.verSion}',
        style: TextStyle(fontSize: 10, color: AppColor.backgroundGray),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget footpag_menuSub({required IconData ic, Function()? fuc}) {
  // ignore: non_constant_identifier_names
  final Icons = Icon(
    ic,
    color: AppColor.primaryColor,
  );

  return GestureDetector(
    onTap: fuc ?? () {},
    child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              border: Border.all(width: 1, color: AppColor.primaryColor)),
          child: Icons,
        )),
  );
}
