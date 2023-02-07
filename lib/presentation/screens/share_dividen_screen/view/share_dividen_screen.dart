import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../model/json/share_dividen_data.dart';
import '../../../../core/themes/app_color.dart';
import '../../../common_widgets/showToast.dart' as showToast;
import '../../../common_widgets/template_screen.dart';
import '../api/bloc/share_dividen_bloc.dart';

const double defaultPadding = 16.0;

class ShareDividenScreen extends StatefulWidget {
  const ShareDividenScreen({Key? key}) : super(key: key);

  @override
  State<ShareDividenScreen> createState() => _ShareDividenScreenState();
}

class _ShareDividenScreenState extends State<ShareDividenScreen> {
  List<List<Map<String, dynamic>>> m_dataList = [];

  List<Map<String, String?>> _mapDataViewItem(
      {required Map<String, dynamic> dividen}) {
    if (dividen.isEmpty) {
      return [];
    }

    // NumberFormat ccyFormat = NumberFormat("#,##0.00", "en_us");

    List<Map<String, String?>> dataView = [
      {"name": "ประจำปี", "value": "${dividen["dividendYear"] ?? ""}"},
      {
        "name": "ปันผล(${dividen["dividendRate"]}%)",
        "value": "${dividen["dividendAmount"] ?? ""}"
      },
      {
        "name": "เฉลี่ยคืน(${dividen["averageReturnRate"]}%)",
        "value": "${dividen["averageReturnAmount"] ?? ""}"
      },
      {"name": "ยอดรวม", "value": "${dividen["totalAmount"] ?? ""}"},
      {"name": "สถานะ", "value": "${dividen["status"] ?? ""}"},
      {"name": "วันที่โอน", "value": "${dividen["receiveDate"] ?? ""}"},
    ];

    return dataView;
  }

  List<List<Map<String, dynamic>>> _mapDataView(
      {required ShareDividens shareDividens}) {
    List<List<Map<String, dynamic>>> viewItems = [];
    shareDividens.dividens.forEach(
        (dividen) => viewItems.add(_mapDataViewItem(dividen: dividen.toMap())));

    return viewItems;
  }

  @override
  void initState() {
    super.initState();
    context.read<ShareDividenBloc>().add(EventShareDividenFetching());
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
    return BlocBuilder<ShareDividenBloc, ShareDividenState>(
        builder: (context, state) {
      if (state is StateShareDividenFetchSuccess) {
        m_dataList = _mapDataView(shareDividens: state.shareDividens);
      }

      return TemplateScreen(
        // onWillPop: (state is ShareDividenFetchSuccess) ? onFalse : onTrue,
        // isLoading: (state is ShareDividenFetching),
        // label: 'กรุณารอสักครู่....',
        child: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15.0),
              child: ListView(children: _ListToWidgetList())),
        ),
      );
    });
  }

  List<Widget> _ListToWidgetList() {
    List<Widget> widgets = [];

    if (m_dataList.isEmpty) {
      widgets.add(Column(children: [Text("ไม่พบข้อมูล"), Text("")]));
    } else {
      m_dataList
          .forEach((dividen) => dividen.forEach((itm) => widgets.add(Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
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
              ))));
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
