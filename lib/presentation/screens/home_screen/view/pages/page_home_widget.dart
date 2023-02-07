import 'package:flutter/material.dart';
import 'package:psucoop_mobile/data/helpers/context_ext.dart';

import '../../../../common_widgets/sizebox_widgets.dart';
import '../../model/variable/get_grid_menu.dart';
import '../widgets/header_info.dart';
import '../widgets/menu_Template.dart';
import '../widgets/top_container.dart';

Widget pageHome({required BuildContext context}) {
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
      sizeboxHeight(10),
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: menuTemplate(
              context: context,
              title: 'ข้อมูลทั่วไป',
              listGridMenu: getGridMenumember()),
        ),
      ),
    ],
  );
}
