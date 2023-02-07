import 'package:flutter/material.dart';

import '../../../../../core/themes/app_color.dart';
import '../../model/screen/gridmenu.dart';
import '../../../../common_widgets/sizebox_widgets.dart';
import 'grid_menu.dart';

Widget menuTemplate(
    {required BuildContext context,
    required List<GridMenu> listGridMenu,
    required String title}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.backgroundGray, width: 1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          color: AppColor.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 5,
                  color: const Color.fromARGB(255, 255, 242, 66),
                ),
                sizeboxWidth(10),
                Text(
                  title,
                  textScaleFactor: 1.3,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        sizeboxHeight(2),
        Material(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.white, width: 1),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          elevation: 3.0,
          color: AppColor.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: getGrid(context: context, getMenu: listGridMenu),
            ),
          ),
        ),
      ]);
}
