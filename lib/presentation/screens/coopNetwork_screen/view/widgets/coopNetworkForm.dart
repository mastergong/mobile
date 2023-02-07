import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/themes/app_color.dart';
import '../../../../common_widgets/sizebox_widgets.dart';
import '../../api/coop_code/coop_code_bloc.dart';

Widget textView(
    {required String text,
    required double fontSz,
    FontWeight? fontWg,
    Color? color,
    int maxLg = 1}) {
  return AutoSizeText(
    text,
    maxLines: maxLg,
    style: TextStyle(
        fontWeight: fontWg,
        fontSize: fontSz,
        color: color ?? AppColor.black,
        fontFamily: 'NotoSansThaiUI'),
  );
}

var pinCode = ({required BuildContext context}) =>
    BlocBuilder<CoopCodeBloc, CoopCodeState>(
      builder: (context, state) {
        if (state is CoopCodeGetSuccessState) {
          print('OK  COOPID ${state.coopModel.businessApi.urlHost}');
        }
        if (state is CoopCodeError) {}
        return SizedBox(
          height: 70.0,
          child: Container(
            constraints: const BoxConstraints(minHeight: 30.0),
            alignment: Alignment.center,
            child: PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              keyboardType: TextInputType.number,
              appContext: context,
              autoUnfocus: true,
              pastedTextStyle: TextStyle(
                color: AppColor.complete,
                fontWeight: FontWeight.bold,
              ),
              length: 4,
              showCursor: false,
              blinkWhenObscuring: true,
              enablePinAutofill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: AppColor.backgroundGray,
                selectedColor: AppColor.backgroundWhite,
              ),
              onCompleted: (v) {
                context.read<CoopCodeBloc>().add(GetCoopcodeEvent(coopCode: v));
              },
              onChanged: (String value) {
                context.read<CoopCodeBloc>().add(GetCoopcodeChangeTextEvent());
              },
            ),
          ),
        );
      },
    );

var lbCoopname = ({required BuildContext context}) =>
    BlocBuilder<CoopCodeBloc, CoopCodeState>(
      builder: (context, state) {
        return SizedBox(
          child: Ink(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(
                  colors: [
                    AppColor.backgroundGray,
                    AppColor.backgroundGray,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              constraints: const BoxConstraints(minHeight: 30.0),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textView(
                      text: (state is CoopCodeGetSuccessState)
                          ? state.coopModel.profile.coopNameThFull
                          : (state is CoopCodeError)
                              ? 'ไม่พบรหัส "สหกรณ์" ที่ท่านใช้งาน '
                              : '',
                      fontSz: 15,
                      maxLg: 2,
                      color: AppColor.black,
                      fontWg: FontWeight.bold),
                  sizeboxHeight(5),
                  textView(
                      text: (state is CoopCodeGetSuccessState)
                          ? state.coopModel.profile.coopNameEnFull
                          : '',
                      fontSz: 15,
                      maxLg: 2,
                      color: AppColor.black,
                      fontWg: FontWeight.bold),
                ],
              ),
            ),
          ),
        );
      },
    );

final confirmButon = BlocBuilder<CoopCodeBloc, CoopCodeState>(
  builder: (context, state) {
    return SizedBox(
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0.0),
          elevation: 5,
        ),
        onPressed: () {
          if (state is CoopCodeGetSuccessState) {
            print('asadasd');
          }
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
              colors: [
                AppColor.contactBtn,
                AppColor.contactBtn,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Container(
            constraints: const BoxConstraints(minHeight: 30.0),
            alignment: Alignment.center,
            child: textView(
                text: 'ยืนยัน',
                fontSz: 20,
                color: AppColor.white,
                fontWg: FontWeight.bold),
          ),
        ),
      ),
    );
  },
);

Widget coopIdForm({required BuildContext context}) {
  return BlocBuilder<CoopCodeBloc, CoopCodeState>(
    builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pinCode(context: context),
          sizeboxHeight(20),
          lbCoopname(context: context),
          sizeboxHeight(10),
          confirmButon,
        ],
      );
    },
  );
  ;
}
