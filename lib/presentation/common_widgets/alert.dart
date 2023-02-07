import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:phoenix_native/phoenix_native.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../../core/themes/app_color.dart';
import '../../core/themes/app_text.dart';
import '../routes/app_router.dart';

closeApp() => SystemNavigator.pop();

toekenexpire({required BuildContext context}) => Alert(
      context: context,
      type: AlertType.none,
      title: 'หมดระยะเวลาการใช้งาน',
      desc: "คุณไม่ได้ทำรายการในระยะเวลาที่กำหนด ต้องการใช้งานแอป ต่อหรือไม่",
      style: AlertStyle(
          titleStyle: AppTextStyle.instance.titleMedium,
          descStyle: AppTextStyle.instance.titleSmall),
      buttons: [
        DialogButton(
            child:
                Text('ออกจากแอป', style: AppTextStyle.instance.titleDarkMedium),
            onPressed: () {
              closeApp();
            }),
        DialogButton(
            child:
                Text('ใช้งานต่อ', style: AppTextStyle.instance.titleDarkMedium),
            onPressed: () {
              PhoenixNative.restartApp();
            }),
      ],
      closeFunction: () => AppRouter.popUntilRoot(),
    ).show();

loginfailed({required BuildContext context}) => Alert(
      context: context,
      title: "เข้าสู่ระบบไม่สำเร็จ",
      desc: "เลขสมาชิกหรือรหัสผ่านไม่ถูกต้อง",
      style: AlertStyle(
          titleStyle: AppTextStyle.instance.titleMedium,
          descStyle: AppTextStyle.instance.titleSmall),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: Text(
            "ปิด",
            style: AppTextStyle.instance.titleDarkMedium,
          ),
        ),
      ],
    ).show();

exitApp({required BuildContext context}) => Alert(
        context: context,
        type: AlertType.none,
        title: "ยืนยันการออกจากระบบ",
        desc: "คุณต้องการออกจากระบบใช่หรือไม่",
        style: AlertStyle(
            titleStyle: AppTextStyle.instance.titleMedium,
            descStyle: AppTextStyle.instance.titleSmall),
        buttons: [
          DialogButton(
              child:
                  Text('ยกเลิก', style: AppTextStyle.instance.titleDarkMedium),
              onPressed: () {
                AppRouter.pop(context);
              }),
          DialogButton(
              color: AppColor.error,
              onPressed: () {
                closeApp();
              },
              child:
                  Text('ยืนยัน', style: AppTextStyle.instance.titleDarkMedium)),
        ]).show();
