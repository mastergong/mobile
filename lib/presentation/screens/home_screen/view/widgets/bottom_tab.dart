import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/themes/app_color.dart';
import '../../../../../core/themes/app_icon.dart';
import '../../event/home_widget_event.dart';
import '../../model/bloc/tab_select/tab_select_bloc.dart';

class Menus {
  String name;
  bool active;
  int itemIndex;
  IconData icon;
  Menus({
    required this.name,
    required this.active,
    required this.itemIndex,
    required this.icon,
  });
}

List<Menus> getListOfMenus() {
  List<Menus> list = [];

  list.add(Menus(
    name: 'หน้าหลัก',
    active: true,
    icon: AppIcons.home,
    itemIndex: 0,
  ));
  list.add(Menus(
    name: 'ธุรกรรม',
    active: true,
    icon: AppIcons.money,
    itemIndex: 1,
  ));
  list.add(Menus(
    name: 'แจ้งเตือน',
    active: true,
    icon: AppIcons.notifications,
    itemIndex: 2,
  ));
  list.add(Menus(
    name: 'ตั้งค่า',
    active: true,
    icon: AppIcons.more,
    itemIndex: 3,
  ));

  return list;
}

BottomNavigationBarItem bottomNavigationBar({
  required IconData icons,
  required String? lb,
  required final int itemIndex,
}) {
  return BottomNavigationBarItem(
    icon: Icon(
      icons,
      size: 20.0,
    ),
    label: lb,
  );
}

Widget bottomTab({required BuildContext context}) {
  return BlocBuilder<TabSelectBloc, TabSelectState>(builder: (context, state) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      currentIndex: state.indexSelect,
      selectedFontSize: 12,
      selectedItemColor: AppColor.error,
      unselectedItemColor: AppColor.primaryColor,
      onTap: (int index) => onBottomTab(context: context, index: index),
      type: BottomNavigationBarType.fixed,
      items: getListOfMenus()
          .where((element) => element.active)
          .map(((e) => bottomNavigationBar(
                icons: e.icon,
                lb: e.name,
                itemIndex: e.itemIndex,
              )))
          .toList(),
    );
  });
}
