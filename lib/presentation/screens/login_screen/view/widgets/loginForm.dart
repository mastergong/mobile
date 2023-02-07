import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../core/themes/app_color.dart';
import '../../../../../core/themes/app_icon.dart';
import '../../../../../core/themes/app_text.dart';
import '../../../../common_widgets/sizebox_widgets.dart';

import '../../event/login_widget_event.dart';
import '../../model/bloc/form_validation/form_validation_bloc.dart';
import '../../model/bloc/showhidden_pwd/showhidden_pwd_bloc.dart';

Widget textView(
    {required String text,
    required double fontSz,
    FontWeight? fontWg,
    Color? color,
    int maxLg = 1}) {
  return Text(
    text,
    maxLines: maxLg,
    style: TextStyle(
        fontWeight: fontWg,
        fontSize: fontSz,
        color: color ?? AppColor.black,
        fontFamily: 'NotoSansThaiUI'),
  );
}

Widget textInput(
    {required TextEditingController ctrl,
    String? hintTx,
    String? errText,
    int? maxLg,
    TextInputType? inputtype,
    List<TextInputFormatter>? formatter,
    IconData? iconpre,
    IconData? iconsuffix,
    bool isHidden = false,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    Function(String)? onChanged,
    Function()? funct}) {
  return TextFormField(
    textInputAction: textInputAction,
    focusNode: focusNode,
    onChanged: onChanged,
    controller: ctrl,
    maxLength: maxLg,
    keyboardType: inputtype,
    inputFormatters: formatter,
    textAlignVertical: TextAlignVertical.bottom,
    obscureText: isHidden,
    decoration: InputDecoration(
      prefixIcon: Icon(iconpre, size: 25, color: AppColor.primaryColor),
      hintText: hintTx,
      errorText: errText,
      counterText: '',
      suffix: InkWell(
        onTap: funct,
        child: Icon(iconsuffix, size: 25, color: AppColor.primaryColor),
      ),
      hintStyle: AppTextStyle.instance.labelMedium,
    ),
  );
}

// ignore: non_constant_identifier_names
Widget Login_form(
    {required BuildContext context,
    required FocusNode userFocusNode,
    required FocusNode passwordFocusNode,
    String lbError = ''}) {
  var userFieldText = textView(
      text: 'เลขที่สมาชิก',
      fontSz: 16,
      color: AppColor.primaryColor,
      fontWg: FontWeight.bold);

  var passwordFieldText = textView(
      text: 'รหัสผ่าน',
      fontSz: 16,
      color: AppColor.primaryColor,
      fontWg: FontWeight.bold);

  var memoText = textView(
      text: '*หมายเหตุ: ใช้รหัสผ่านเดียวกับเว็บไซต์สอบถามข้อมูลของสหกรณ์',
      fontSz: 14,
      maxLg: 2,
      color: AppColor.error);

  var memoError =
      textView(text: lbError, fontSz: 14, maxLg: 2, color: AppColor.error);

  final userField = BlocBuilder<FormValidateBloc, FormValidationState>(
      builder: (context, formstate) {
    return textInput(
        onChanged: (value) {
          context
              .read<FormValidateBloc>()
              .add(MembNoChangedEvent(membno: value));
        },
        textInputAction: TextInputAction.done,
        focusNode: userFocusNode,
        ctrl: ctrTextusername,
        hintTx: "กรอกเลขที่สมาชิก",
        errText: formstate.membno.invalid ? 'กรุณากรอกเลขที่สมาชิก' : null,
        maxLg: 5,
        inputtype: TextInputType.number,
        formatter: [FilteringTextInputFormatter.digitsOnly],
        iconpre: AppIcons.user);
  });

  final passwordField = BlocBuilder<FormValidateBloc, FormValidationState>(
      builder: (fromcontext, formstate) {
    return BlocBuilder<ShowHiddenPwdBloc, ShowHiddenPwdState>(
        builder: (context, state) {
      return textInput(
          onChanged: (value) {
            fromcontext
                .read<FormValidateBloc>()
                .add(PasswordChangedEvent(password: value));
          },
          textInputAction: TextInputAction.done,
          focusNode: passwordFocusNode,
          ctrl: ctrTextpasswd,
          isHidden: state.isHidden,
          hintTx: "กรอกรหัสผ่าน",
          errText: formstate.password.invalid ? 'กรุณากรอกรหัสผ่าน' : null,
          funct: () =>
              showOrHiddenPassword(value: state.isHidden, context: context),
          iconsuffix: state.isHidden ? AppIcons.eye : AppIcons.eyeSlash,
          iconpre: AppIcons.lock);
    });
  });

  final loginButon = BlocBuilder<FormValidateBloc, FormValidationState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return SizedBox(
            height: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0.0),
                elevation: 5,
              ),
              onPressed: state.status.isValidated
                  ? () => onLogin(context: context)
                  : null,
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
                  child: textView(
                      text: 'เข้าสู่ระบบ',
                      fontSz: 20,
                      color: AppColor.white,
                      fontWg: FontWeight.bold),
                ),
              ),
            ));
      });

  return Container(
    width: double.infinity,
    //color: Colors.amber,
    alignment: Alignment.center,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userFieldText,
          userField,
          sizeboxHeight(5),
          passwordFieldText,
          passwordField,
          sizeboxHeight(10),
          if (lbError.isNotEmpty) memoError,
          sizeboxHeight(3),
          memoText,
          sizeboxHeight10(),
          loginButon,
        ]),
  );
}
