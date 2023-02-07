import 'package:flutter/material.dart';
import '../../model/screen/gridmenu.dart';
import '../../../../common_widgets/menuItem.dart';

List<Widget> getGrid({
  required BuildContext context,
  int colMax = 3,
  required List<GridMenu> getMenu,
}) {
  List<Widget> list = [];
  List<GridMenu> listMenuIcon = [];

  for (var iData in getMenu) {
    listMenuIcon.add(iData);

    if (listMenuIcon.length == colMax) {
      list.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (var i in listMenuIcon)
            menuItem(
                context: context,
                title: i.title,
                iconData: i.getimageIcon,
                //  gradient: theme.grayGradient,
                tabfun: i.onTap,
                strPathicon: i.imagePath),
        ],
      ));
      listMenuIcon.clear();
    }
  }

  if (listMenuIcon.isNotEmpty) {
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var i in listMenuIcon)
          menuItem(
              context: context,
              title: i.title,
              iconData: i.getimageIcon,
              //  gradient: theme.grayGradient,
              tabfun: i.onTap,
              strPathicon: i.imagePath),
      ],
    ));
  }

  return list;
}
