import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psucoop_mobile/data/network/http_status.dart';
import 'package:psucoop_mobile/presentation/common_widgets/template_screen.dart';
import 'package:psucoop_mobile/presentation/screens/interest_rate_screen/api/model/json/interestLoanModel.dart';
import 'package:psucoop_mobile/presentation/screens/interest_rate_screen/api/model/json/interestSavingFixedModel.dart';

import '../../../../common_widgets/sizebox_widgets.dart';
import '../../api/model/bloc/interestBloc.dart';
//import '../../view/widgets/list_interest_saving.dart' as interest_rate_saving;
//import '../../view/widgets/list_interest_savingfixed.dart'
//    as interest_rate_savingfixed;
//import '../../view/widgets/list_interest_loan.dart' as interest_rate_loan;
import '../../api/model/json/interestSavingModel.dart';
import '../widgets/interest_list_template.dart';

Widget interestTemplate(
    {required BuildContext context,
    required String title,
    required Color? color}) {
  return BlocBuilder<CoopInterestInfoBloc, CoopInfoState>(
      builder: (context, state) {
    return Column(
      children: [
        Material(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          color: Colors.white,
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 5,
                  color: color ?? Color.fromARGB(255, 1, 50, 96),
                ),
                sizeboxWidth(5),
                Text(
                  title,
                  textScaleFactor: 1.2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        sizeboxHeight(1),
        Material(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          elevation: 3.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                if (state is CoopGetInterestInfo) ...[
                  if (title == 'เงินฝาก')
                    showInterestInfo<InterestSavingModel>(
                        context: context,
                        color: color ?? Color.fromARGB(255, 1, 50, 96),
                        model: state.interestSavingModel),
                  if (title == 'เงินฝากประจำ')
                    showInterestInfo<InterestSavingFixedModel>(
                        context: context,
                        color: color ?? Color.fromARGB(255, 1, 50, 96),
                        model: state.interestSavingFixedModel),
                  if (title == 'เงินกู้')
                    showInterestInfo<InterestLoanModel>(
                        context: context,
                        color: color ?? Color.fromARGB(255, 1, 50, 96),
                        model: state.interestLoanModel),
                ] else ...[
                  Center(
                    child: Text('ไม่มีรายการข้อมูล'),
                  ),
                ]
              ],
            ),
            //),
          ),
        ),
      ],
    );
  });
}
