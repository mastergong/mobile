import 'package:flutter/material.dart';
import 'package:psucoop_mobile/presentation/routes/routes.dart';

import '../../../../../core/themes/app_color.dart';
import '../../../../../core/themes/app_icon.dart';
import '../../../../routes/app_router.dart';
import '../screen/gridmenu.dart';

List<GridMenu> getGridMenumember() {
  List<GridMenu> list = [];

  // ignore: non_constant_identifier_names
  sub_memu(
          {required String title,
          required IconData? imageIcon,
          required String? imagestrIcon,
          Function()? fuc}) =>
      GridMenu(
          imageIcon: imageIcon,
          imagePath: imagestrIcon,
          title: title,
          color: AppColor.secondaryColor,
          onTap: fuc);

  list.add(sub_memu(
      title: "ข้อมูลส่วนตัว",
      imageIcon: null,
      imagestrIcon: AppIconsPath.bank,
      fuc: () {
        print("ข้อมูลส่วนตัว");
        AppRouter.pushNamed(Routes.userInfoScreenRoute);
      }));

  list.add(sub_memu(
      title: "บัญชีเงินฝาก",
      imageIcon: null,
      imagestrIcon: AppIconsPath.bank,
      fuc: () {
        print("บัญชีเงินฝาก");
        // AppRouter.pushNamed('routeName');
      }));

  list.add(sub_memu(
      title: "สัญญาเงินกู้",
      imageIcon: null,
      imagestrIcon: AppIconsPath.contract,
      fuc: () {
        print("สัญญาเงินกู้");
        // AppRouter.pushNamed('routeName');
      }));

  list.add(sub_memu(
      title: "การส่งหุ้น",
      imageIcon: null,
      imagestrIcon: AppIconsPath.invoice,
      fuc: () {
        print("การส่งหุ้น");
        // AppRouter.pushNamed('routeName');
      }));

  list.add(sub_memu(
      title: "เรียกเก็บประจำเดือน",
      imageIcon: null,
      imagestrIcon: AppIconsPath.receipt,
      fuc: () {
        print("เรียกเก็บประจำเดือน");
        // AppRouter.pushNamed('routeName');
      }));

  list.add(sub_memu(
      title: "ใบเสร็จประจำเดือน",
      imageIcon: null,
      imagestrIcon: AppIconsPath.calendar,
      fuc: () {
        print("ใบเสร็จประจำเดือน");
        // AppRouter.pushNamed('routeName');
      }));

  list.add(sub_memu(
      title: "ปันผล/เฉลี่ยคืน",
      imageIcon: null,
      imagestrIcon: AppIconsPath.tax,
      fuc: () {
        print("ปันผล/เฉลี่ยคืน");
        AppRouter.pushNamed(Routes.shareDividenScreenRoute);
      }));

  list.add(sub_memu(
      title: "อัตราดอกเบี้ย",
      imageIcon: null,
      imagestrIcon: AppIconsPath.margin,
      fuc: () {
        print("อัตราดอกเบี้ย");
        AppRouter.pushNamed(Routes.interRestRoute);
      }));

  list.add(sub_memu(
      title: "การค้ำประกัน",
      imageIcon: null,
      imagestrIcon: AppIconsPath.respect,
      fuc: () {
        print("การค้ำประกัน");
        // AppRouter.pushNamed('routeName');
      }));

  list.add(sub_memu(
      title: "ผู้รับผลประโยชน์",
      imageIcon: null,
      imagestrIcon: AppIconsPath.benefit,
      fuc: () {
        print("ผู้รับผลประโยชน์");
        // AppRouter.pushNamed('routeName');
      }));

  return list;
}

List<GridMenu> getGridMenuCoop() {
  List<GridMenu> list = [];

  list.add(GridMenu(
    imageIcon: null,
    imagePath: null,
    title: "โอนเงินระหว่างบัญชี",
    color: AppColor.primaryColor,
    onTap: () {
      print("โอนเงินระหว่างบัญชี");
      // AppRouter.pushNamed('routeName');
    },
  ));
  list.add(GridMenu(
    imageIcon: null,
    imagePath: null,
    title: "รับเงินกู้",
    color: AppColor.primaryColor,
    onTap: () {
      print("รับเงินกู้");
      // AppRouter.pushNamed('routeName');
    },
  ));

  return list;
}

List<GridMenu> getGridMenuBank() {
  List<GridMenu> list = [];

  list.add(GridMenu(
    imageIcon: null,
    imagePath: null,
    title: "โอนเงินไปธนาคาร",
    color: AppColor.primaryColor,
    onTap: () {
      print("โอนเงินไปธนาคาร");
      // AppRouter.pushNamed('routeName');
    },
  ));
  list.add(GridMenu(
    imageIcon: null,
    imagePath: null,
    title: "โอนเงินเข้าสหกรณ์",
    color: AppColor.primaryColor,
    onTap: () {
      print("โอนเงินเข้าสหกรณ์");
      // AppRouter.pushNamed('routeName');
    },
  ));

  return list;
}
