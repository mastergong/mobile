import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/helpers/context_ext.dart';
import '../../../../routes/app_router.dart';
import '../../api/model/bloc/interestBloc.dart';

// import '../interest_detail_saving_screen.dart' as savingScreen;
//import '../interest_detail_savingfixed_screen.dart' as savingFixedScreen;
//import '../interest_detail_loan_screen.dart' as loanScreen;

import '../interest_detail_screen.dart' as detailScreen;

import '../../api/model/json/interestSavingModel.dart';
import '../../api/model/json/interestSavingFixedModel.dart';
import '../../api/model/json/interestLoanModel.dart';

Widget showInterestInfo<T>(
    {required BuildContext context,
    required Color color,
    required List<T> model}) {
  return Wrap(
    children: <Widget>[
      if (model[0] is InterestSavingModel)
        showSavingInfo(context: context, color: color)
      else if (model[0] is InterestSavingFixedModel)
        showSavingFixedInfo(context: context, color: color)
      else if (model[0] is InterestLoanModel)
        showLoanInfo(context: context, color: color),
    ],
  );
  ;
}

Widget showSavingInfo({required BuildContext context, required Color color}) {
  return BlocBuilder<CoopInterestInfoBloc, CoopInfoState>(
    builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (state is CoopGetInterestInfo)
            for (var value in state.interestSavingModel) ...[
              Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Text(value.rateDesc),
                            onTap: (() {
                              final snackBar = SnackBar(
                                content: Text('รายละเอียด${value.rateDesc}'),
                              );

                              AppRouter.push(detailScreen.InterestDetailScreen(
                                title: value.rateDesc,
                                color: color,
                                rateDate: value.rateDate,
                                rate: value.rates,
                                model: state.interestSavingModel,
                              ));

                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(snackBar);
                            }),
                          ),
                          Text(
                            value.rates[0].rate.toString(),
                            textAlign: TextAlign.end,
                          ),
                        ])
                  ],
                ),
              ),
            ],
        ],
      );
    },
  );
  ;
}

Widget showSavingFixedInfo(
    {required BuildContext context, required Color color}) {
  return BlocBuilder<CoopInterestInfoBloc, CoopInfoState>(
    builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (state is CoopGetInterestInfo)
            for (var value in state.interestSavingFixedModel) ...[
              Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Text(value.rateDesc),
                            onTap: (() {
                              final snackBar = SnackBar(
                                content: Text('รายละเอียด${value.rateDesc}'),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        detailScreen.InterestDetailScreen(
                                          title: value.rateDesc,
                                          color: color,
                                          rateDate: value.rateDate,
                                          rate: value.rates,
                                          model: state.interestSavingFixedModel,
                                        )),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }),
                          ),
                          Text(
                            value.rates[0].rate.toString(),
                            textAlign: TextAlign.end,
                          ),
                        ])
                  ],
                ),
              ),
            ],
        ],
      );
    },
  );
  ;
}

Widget showLoanInfo({required BuildContext context, required Color color}) {
  return BlocBuilder<CoopInterestInfoBloc, CoopInfoState>(
    builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (state is CoopGetInterestInfo)
            for (var value in state.interestLoanModel) ...[
              Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //width: MediaQuery.of(context).size.width * 0.7,
                            width: context.screenWidth * 0.7,
                            child: InkWell(
                              child: Text(
                                value.rateDesc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: (() {
                                final snackBar = SnackBar(
                                  content: Text('รายละเอียด${value.rateDesc}'),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          detailScreen.InterestDetailScreen(
                                            title: value.rateDesc,
                                            color: color,
                                            rateDate: value.rateDate,
                                            rate: value.rates,
                                            model: state.interestLoanModel,
                                          )),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }),
                            ),
                          ),
                          Text(
                            value.rates[0].rate.toString(),
                            textAlign: TextAlign.end,
                          ),
                        ])
                  ],
                ),
              ),
            ],
        ],
      );
    },
  );
  ;
}
