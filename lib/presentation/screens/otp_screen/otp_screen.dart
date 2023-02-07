import 'package:flutter/material.dart';
import '../../../core/themes/app_color.dart';
import '../../common_widgets/sizebox_widgets.dart';
import '../../common_widgets/template_screen.dart';
import '../../common_widgets/textFieldOTP.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    textFieldOTP(bool first, last) {
      return SizedBox(
        height: 60,
        width: 50,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: TextFormField(
            autofocus: true,
            onChanged: (value) {
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
                  borderSide:
                      BorderSide(width: 1, color: AppColor.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppColor.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      );
    }

    return TemplateScreen(
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          textFieldOTP(true, false),
          textFieldOTP(false, false),
          textFieldOTP(false, false),
          textFieldOTP(false, false),
          textFieldOTP(false, false),
          textFieldOTP(false, true),
        ]),
      ),
    );
  }
}
