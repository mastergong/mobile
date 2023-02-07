import 'package:flutter/material.dart';
import 'package:psucoop_mobile/core/themes/app_color.dart';
import 'package:psucoop_mobile/core/themes/app_text.dart';
import 'package:psucoop_mobile/data/helpers/context_ext.dart';
import 'package:psucoop_mobile/presentation/common_widgets/sizebox_widgets.dart';

import '../widgets/top_container.dart';
import 'package:tab_container/tab_container.dart';

List<Widget> _getTabs2() {
  return <Widget>[
    Container(
      width: double.infinity,
      color: AppColor.backgroundGray,
      child: Text('เคลื่อนไหวบัญชี'),
    ),
    Text('ข้อความสวนตัว'),
  ];
}

List<Widget> _getChildren2() {
  return <Widget>[
    Text('assets/car1.jpg'),
    Text('assets/car2.jpg'),
  ];
}

Widget pageNotification({required BuildContext context}) {
  TabContainerController controller = TabContainerController(length: 2);

  return Container(
    padding: EdgeInsets.only(top: 10.0, bottom: 10),
    child: TabContainer(
      controller: controller,
      isStringTabs: false,
      color: AppColor.backgroundWhite,
      selectedTextStyle: AppTextStyle.instance.titleSmall,
      unselectedTextStyle: AppTextStyle.instance.titleSmall,
      children: _getChildren2(),
      tabs: _getTabs2(),
      onEnd: () {
        print('onEnd TabContainer');
      },
    ),
  );
}
