import 'package:flutter/material.dart';

import '../../core/themes/app_color.dart' as theme;
import '../../core/themes/app_color.dart';

Widget textFieldOTP(
    {required BuildContext context, required bool first, last}) {
  return SizedBox(
    height: 60,
    width: 50,
    child: AspectRatio(
      aspectRatio: 1.0,
      child: TextFormField(
        onChanged: (value) {
          print(' $value');
          print(' ${value.length}');

          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColor.header),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColor.header),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),
  );
}
