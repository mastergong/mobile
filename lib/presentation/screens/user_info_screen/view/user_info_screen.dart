import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/themes/app_color.dart';
import '../../../common_widgets/showToast.dart' as showToast;
import '../../../common_widgets/template_screen.dart';
import '../api/bloc/user_info_bloc.dart';

const double defaultPadding = 16.0;

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  List<Map<String, String?>> m_dataList = [];

  String _getFnameEng(String sFnameTH) {
    if (sFnameTH == "นาย") {
      return "Mr.";
    }

    if (sFnameTH == "นางสาว") {
      return "Ms.";
    }

    if (sFnameTH == "นาง") {
      return "Mrs.";
    }

    return "";
  }

  List<Map<String, String?>> _mapDataView(
      {required Map<String, dynamic> dataMap}) {
    //
    if (dataMap.isEmpty) {
      return [];
    }

    NumberFormat ccyFormat = NumberFormat("#,##0.00", "en_us");

    Map<String, String> PayShareTypeSts = {
      "1": "ส่งเรียกเก็บ",
      "2": "หักจากบัญชี",
      "3": "หักค้างรับจากบัญชี",
      "4": "ธนาคาร",
    };
    String? sPayShareType = "ชำระเอง";
    if (PayShareTypeSts.containsKey(dataMap["mastPaySts"])) {
      sPayShareType = PayShareTypeSts[dataMap["mastPaySts"]];
    }

    Map<String, String> DividenPaidTypeSts = {
      "1": "รับเงินสด",
      "2": "โอนเข้าบัญชี",
      "3": "โอนเข้าธนาคาร",
    };
    String? sDvdPaidType = "-";
    if (DividenPaidTypeSts.containsKey(dataMap["mastPaiddivdSts"])) {
      sDvdPaidType = (dataMap["mastRecvBankNo"].isNotEmpty &&
              dataMap["mastPaiddivdSts"] == "2")
          ? "${DividenPaidTypeSts[dataMap["mastPaiddivdSts"]]} เลขที่ ${dataMap["mastRecvBankNo"]}"
          : DividenPaidTypeSts[dataMap["mastPaiddivdSts"]];
    }

    Map<String, String> MastRecSts = {
      "1": "ปกติ",
      "2": "เข้าใหม่",
      "3": "หยุดส่งหุ้น",
      "4": "พ้นสภาพ"
    };
    String? sMastRectSts = "-";
    if (MastRecSts.containsKey(dataMap["mastRecSts"])) {
      sMastRectSts = MastRecSts[dataMap["mastRecSts"]];
    }

    List<Map<String, String?>> dataView = [
      {"name": "เลขที่สมาชิก", "value": dataMap["mastMembNo"]},
      {
        "name": "ชื่อ-สกุล",
        "value": "${dataMap["mastFname"]}${dataMap["mastName"]}"
      },
      {
        "name": "ชื่อ-สกุล(อังกฤษ)",
        "value":
            "${_getFnameEng(dataMap["mastFname"])}${dataMap["mastEngName"]} ${dataMap["mastEngLname"]}"
      },
      {"name": "เลขบัตรประชาชน", "value": dataMap["mastCardId"]},
      {
        "name": "ที่อยู่ทะเบียนบ้าน",
        "value": "${dataMap["mastAddr"]} ${dataMap["mastZip"]}"
      },
      {
        "name": "ที่อยู่จัดส่งเอกสาร",
        "value": "${dataMap["mastAddr2"]} ${dataMap["mastZip2"]}"
      },
      {"name": "วันเกิด", "value": dataMap["mastBirthYmd"]},
      {
        "name": "เบอร์โทรศัพท์เคลื่อนที่",
        "value": dataMap["mastMobile"].isEmpty ? "-" : dataMap["mastMobile"]
      },
      {
        "name": "เบอร์ศัพท์",
        "value": dataMap["mastTel"].isEmpty ? "-" : dataMap["mastTel"]
      },
      {"name": "อีเมลล์", "value": dataMap["mastEmail"]},
      {"name": "ตำแหน่งงาน", "value": dataMap["mastPosition"]},
      {"name": "หน่วยงาน", "value": dataMap["unitName"]},
      {"name": "สังกัด", "value": dataMap["deptName"]},
      {
        "name": "เงินเดือน",
        "value": ccyFormat
            .format(double.parse(dataMap["mastSalary"].toString()) +
                double.parse(dataMap["mastSalary2"].toString()))
            .toString()
      },
      {"name": "วันที่เป็นสมาชิก", "value": dataMap["mastYmdIn"]},
      {
        "name": "วันที่ลาออก",
        "value":
            dataMap["mastYmdOut"].trim().isEmpty ? "-" : dataMap["mastYmdOut"]
      },
      {"name": "ประเภทสมาชิก", "value": dataMap["stsTypeDesc"]},
      {
        "name": "สถานภาพสมาชิก",
        "value": sMastRectSts!.isEmpty ? "-" : sMastRectSts
      },
      {
        "name": "อายุการเป็นสมาชิก(เดือน)",
        "value": dataMap["mastPaidPerd"].toString()
      },
      {
        "name": "ชำระหุ้น/งวด",
        "value": ccyFormat.format(dataMap["mastMonthShr"] * 10)
      },
      {
        "name": "ทุนเรือนหุ้น",
        "value":
            ccyFormat.format(double.parse(dataMap["mastPaidShr"].toString()))
      },
      {
        "name": "ดอกเบี้ยจ่ายสะสม",
        "value": ccyFormat.format(0.0 +
            double.parse(dataMap["mastIntComm"].toString()) +
            double.parse(dataMap["mastIntEmrg"].toString()) +
            double.parse(dataMap["mastIntSpec"].toString()) +
            double.parse(dataMap["mastPromInt"].toString()))
      },
      {
        "name": "การชำระหุ้นหนี้",
        "value": sPayShareType!.isEmpty ? "-" : sPayShareType
      },
      {
        "name": "การรับปันผล",
        "value": sDvdPaidType!.isEmpty ? "-" : sDvdPaidType
      },
      {
        "name": "เลขที่บัญชีธนาคาร",
        "value":
            dataMap["mastPayBankNo"].isEmpty ? "-" : dataMap["mastPayBankNo"]
      },
    ];

    return dataView;
  }

  @override
  void initState() {
    super.initState();
    context.read<UserInfoBloc>().add(EventUserInfoFetching());
  }

  Future<bool> onFalse() async {
    showToast.toastBomtom(context: context, lb: 'กรุณารอสักครู่.......');
    return false;
  }

  Future<bool> onTrue() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoBloc, UserInfoState>(builder: (context, state) {
      if (state is StateUserInfoFetchSuccess) {
        m_dataList = _mapDataView(dataMap: state.userInfoResponse.toJson());
      }

      return TemplateScreen(
        // onWillPop: (state is UserInfoFetchSuccess) ? onFalse : onTrue,
        // isLoading: (state is UserInfoFetching),
        // label: 'กรุณารอสักครู่....',
        child: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15.0),
              child: ListView(children: _ListToWidgetList(oList: m_dataList))),
        ),
      );
    });
  }

  List<Widget> _ListToWidgetList({required List<Map<String, String?>> oList}) {
    List<Widget> widgets = [];

    if (oList.isEmpty) {
      widgets.add(Column(children: [Text("ไม่พบข้อมูล"), Text("")]));
    } else {
      oList.forEach((itm) {
        widgets.add(Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${itm["name"]!}:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  itm["value"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
            Divider(
              height: 13.0,
              thickness: 1.0,
              color: AppColor.transparent,
            ),
            // Container(
            //   //padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: Text(
            //       "",
            //     ),
            //   ),
            // ),
          ],
        ));
      });
    }

    return widgets;

    //Method: 1
    // return oMap.entries
    //     .map((e) => Column(
    //           children: [
    //             Text(
    //               e.key,
    //               // style: TextStyle(
    //               //     fontWeight: fontWg,
    //               //     fontSize: fontSz,
    //               //     color: color ?? Colors.black,
    //               //     fontFamily: 'NotoSansThaiUI'),
    //             ),
    //             Text(
    //               e.value.toString(),
    //               // style: TextStyle(
    //               //     fontWeight: fontWg,
    //               //     fontSize: fontSz,
    //               //     color: color ?? Colors.black,
    //               //     fontFamily: 'NotoSansThaiUI'),
    //             ),
    //           ],
    //         ))
    //     .toList();

    //Method: 2
    // List<Widget> widgets = [];
    // data.map((key, value) {
    //   widgets.add(Column(children: [
    //     Text(
    //       key,
    //       // style: TextStyle(
    //       //     fontWeight: fontWg,
    //       //     fontSize: fontSz,
    //       //     color: color ?? Colors.black,
    //       //     fontFamily: 'NotoSansThaiUI'),
    //     ),
    //     Text(
    //       value.toString(),
    //       // style: TextStyle(
    //       //     fontWeight: fontWg,
    //       //     fontSize: fontSz,
    //       //     color: color ?? Colors.black,
    //       //     fontFamily: 'NotoSansThaiUI'),
    //     ),
    //   ]));
    //   return MapEntry(key, value);
    // });
    // return widgets;
  }
}
