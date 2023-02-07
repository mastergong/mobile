import 'package:flutter/material.dart';
import '../../../../../core/themes/app_text.dart';
import '../../event/widget_event.dart';

Widget renderDoneBtn() {
  return Container();
}

Widget renderSkipBtn() {
  return Text(
    "ข้าม",
    style: AppTextStyle.instance.bodyLarge,
  );
}

Widget renderNextBtn() {
  return Text(
    "ถัดไป",
    style: AppTextStyle.instance.bodyLarge,
  );
}
