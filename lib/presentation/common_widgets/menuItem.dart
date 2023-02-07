import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:psucoop_mobile/core/themes/app_text.dart';
import 'package:psucoop_mobile/data/helpers/context_ext.dart';

import '../../core/themes/app_color.dart';

menuItem({
  required BuildContext context,
  required String title,
  required IconData? iconData,
  required String? strPathicon,
  LinearGradient? gradient,
  Function()? tabfun,
}) {
  return GestureDetector(
    //InkWell
    onTap: tabfun ?? () {},
    child: Container(
      height: context.screenWidth * 0.17,
      width: context.screenWidth * 0.26,
      // margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: gradient,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: iconData != null
                  ? Icon(iconData, size: 24, color: AppColor.blackGrey)
                  : strPathicon != null
                      ? Image.asset(
                          strPathicon,
                          width: 24,
                          height: 24,
                          color: AppColor.blackGrey,
                        )
                      : null,
            ),
          ),
          const SizedBox(height: 1),
          AutoSizeText(
            title,
            maxLines: 1,
            style: AppTextStyle.instance.labelSmall,
          )
        ],
      ),
    ),
  );
}
