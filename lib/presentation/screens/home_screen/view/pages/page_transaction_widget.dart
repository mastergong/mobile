import 'package:flutter/material.dart';
import 'package:psucoop_mobile/data/helpers/context_ext.dart';

import '../../../../../core/themes/app_color.dart';
import '../../../../../core/themes/app_text.dart';
import '../../../../common_widgets/sizebox_widgets.dart';
import '../../model/variable/get_grid_menu.dart';
import '../widgets/header_info.dart';
import '../widgets/menu_Template.dart';
import '../widgets/top_container.dart';

bool registransition = true;

tarnsEmty({required BuildContext context}) => Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: MaterialButton(
            onPressed: () => {},
            child: Text('กรุณาลงทะเบียน สำหรับธุรกรรม ออนไลน์',
                style: AppTextStyle.instance.bodyLarge),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: MaterialButton(
            onPressed: () => {},
            child: SizedBox(
                height: 40.0,
                width: context.screenWidth / 4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                    elevation: 5,
                  ),
                  onPressed: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.primaryColor,
                          AppColor.primaryColor,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 30.0),
                      alignment: Alignment.center,
                      child: Text(
                        'ลงทะเบียน',
                        style: AppTextStyle.instance.titleDarkMedium,
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ],
    ));

transWiget({required BuildContext context}) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          menuTemplate(
            context: context,
            title: 'สหกรณ์',
            listGridMenu: getGridMenuCoop(),
          ),
          sizeboxHeight(20),
          menuTemplate(
            context: context,
            title: 'ธนาคาร',
            listGridMenu: getGridMenuBank(),
          ),
        ],
      ),
    );

Widget pageTransaction({required BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TopContainer(
        width: context.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: headerInfo(context: context),
            )
          ],
        ),
      ),
      sizeboxHeight(20),
      registransition
          ? transWiget(context: context)
          : tarnsEmty(context: context),
    ],
  );
}
