import 'package:flutter/material.dart';

import '../../../../../core/themes/app_color.dart';
import '../../../../../core/themes/app_icon.dart';
import '../../../../../core/themes/app_images.dart';
import '../../../../../core/themes/app_text.dart';
import '../../../../common_widgets/alert.dart';
import '../../../../common_widgets/sizebox_widgets.dart';

Widget headerInfo({required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      sizeboxHeight(20),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 0,
            child: Image.asset(
              AppImages.avatar,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          ),
          sizeboxWidth(10),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sizeboxHeight(10),
                Text('นาย ก้กก ขขขุขขขข',
                    style: AppTextStyle.instance.titleDarkMedium),
                Text('เลขที่สมาชิก 00000',
                    style: AppTextStyle.instance.titleDarkSmall),
              ],
            ),
          ),
          sizeboxHeight(20),
          InkWell(
              child: Icon(
                AppIcons.sigout,
                color: AppColor.backgroundWhite,
                size: 30,
              ),
              onTap: () {
                exitApp(context: context);
              }),
        ],
      ),
      sizeboxHeight(10),
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: SizedBox(
          height: 85.0,
          width: double.infinity,
          child: Center(
            child: Stack(
              children: <Widget>[
                Opacity(
                  opacity: 0.25,
                  child: ModalBarrier(
                    dismissible: false,
                    color: AppColor.backgroundGray,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ออมทรัพย์',
                                  style: AppTextStyle.instance.titleDarkSmall),
                              Text('แสดง *',
                                  style: AppTextStyle.instance.titleDarkSmall),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('xx-xxxxx-x',
                                  style: AppTextStyle.instance.titleDarkSmall),
                              Text('xx.xx',
                                  style: AppTextStyle.instance.titleDarkSmall),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
