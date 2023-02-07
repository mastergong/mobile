import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:psucoop_mobile/core/themes/app_icon.dart';
import 'package:psucoop_mobile/core/themes/app_text.dart';

import '../../../../core/themes/app_color.dart';
import '../../../../presentation/common_widgets/sizebox_widgets.dart';
import '../../../common_widgets/template_screen.dart';

import '../api/model/bloc/interestBloc.dart';

import '../api/model/json/interestSavingModel.dart' as savingModel;
import '../api/model/json/interestSavingFixedModel.dart' as savingFixedModel;
import '../api/model/json/interestLoanModel.dart' as loanModel;

class InterestDetailScreen extends StatefulWidget {
  String title;
  Color color;
  String rateDate;
  List<dynamic> rate;
  List<dynamic> model;

  InterestDetailScreen(
      {required this.title,
      required this.color,
      required this.rateDate,
      required this.rate,
      required this.model});

  @override
  State<InterestDetailScreen> createState() => InterestDetailState();
}

class InterestDetailState extends State<InterestDetailScreen> {
  @override
  void initState() {
    context.read<CoopInterestInfoBloc>().add(GetCoopcodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoopInterestInfoBloc, CoopInfoState>(
      builder: (context, state) {
        NumberFormat _numberFormat = NumberFormat.decimalPattern('en_us');
        DateFormat _dateFormat = DateFormat('d MMMM yyyy');
        DateTime _date = DateTime.parse(widget.rateDate);
        _date = DateTime(_date.year + 543, _date.month, _date.day);
        List<savingModel.Rate> savingRate = [];
        List<savingFixedModel.Rate> savingFixedRate = [];
        List<loanModel.Rate> loanRate = [];
        if (widget.model[0] is savingModel.InterestSavingModel)
          savingRate = List<savingModel.Rate>.from(widget.rate);
        if (widget.model[0] is savingFixedModel.InterestSavingFixedModel)
          savingFixedRate = List<savingFixedModel.Rate>.from(widget.rate);
        if (widget.model[0] is loanModel.InterestLoanModel)
          loanRate = List<loanModel.Rate>.from(widget.rate);

        return TemplateScreen(
          //isLoading: (state is CoopCodeLoadState),
          //label: 'กรุณารอสักครู่....',
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state is CoopGetInterestInfo) ...[
                  header(
                    context: context,
                    title: widget.title,
                    color: widget.color,
                    date: _dateFormat.format(_date),
                  ),
                  sizeboxHeight(1),
                  if (widget.model[0] is savingModel.InterestSavingModel)
                    savingDetailBody(context: context, rate: savingRate)
                  else if (widget.model[0]
                      is savingFixedModel.InterestSavingFixedModel)
                    savingFixedDetailBody(
                        context: context, rate: savingFixedRate)
                  else if (widget.model[0] is loanModel.InterestLoanModel)
                    loanDetailBody(context: context, rate: loanRate),
                ] // End IF State => CoopGetInterestInfo
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget header(
    {required BuildContext context,
    required String title,
    required Color? color,
    required String date}) {
  return BlocBuilder<CoopInterestInfoBloc, CoopInfoState>(
    builder: (context, state) {
      return Material(
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
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(AppIcons.back),
                  ),
                  Container(
                    height: 20,
                    width: 5,
                    color: color ?? AppColor.primaryColor,
                  ),
                  sizeboxWidth(5),
                  Text(
                    title,
                    textScaleFactor: 1.2,
                    style: AppTextStyle.instance.titleMedium,
                  ),
                ],
              ),
              AutoSizeText(
                'อัพเดตล่าสุดเมื่อ $date',
                textScaleFactor: 0.9,
                style: AppTextStyle.instance.titleMedium,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget savingDetailBody(
    {required BuildContext context, required List<savingModel.Rate> rate}) {
  return Material(
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
          Container(
              width: double.infinity,
              child: Wrap(
                children: [
                  for (var detail in rate) ...[
                    if (detail.rateMinAmount <= 0.0) ...[
                      showTextinRow(
                          context: context,
                          text: 'ไม่มีขั้นต่ำ',
                          currency: detail.rate),
                    ] else if (detail.rateMinAmount > 0.0) ...[
                      showTextinRow(
                          context: context,
                          text:
                              'ฝากขั้นต่ำ ${NumberFormat.decimalPattern('en_us').format(detail.rateMinAmount)}',
                          currency: detail.rate),
                    ],
                  ]
                ],
              )),
        ],
      ),
    ),
  );
}

Widget savingFixedDetailBody(
    {required BuildContext context,
    required List<savingFixedModel.Rate> rate}) {
  return Material(
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
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                for (var detail in rate) ...[
                  showTextinRow(
                      context: context,
                      text: 'ฝากตั้งแต่ ${detail.rateYearCount} ปี ขึ้นไป',
                      currency: detail.rate),
                ]
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget loanDetailBody(
    {required BuildContext context, required List<loanModel.Rate> rate}) {
  return Material(
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
          Container(
              width: double.infinity,
              child: Wrap(
                children: [
                  for (var detail in rate) ...[
                    showTextinRow(
                      context: context,
                      text: 'ยอดกู้ตั้งแต่ ${detail.rateMinAmount} ขึ้นไป',
                      currency: double.parse(detail.rate),
                    ),
                  ]
                ],
              )),
        ],
      ),
    ),
  );
}

Widget showTextinRow(
    {required BuildContext context,
    required String text,
    required double currency}) {
  return BlocBuilder<CoopInterestInfoBloc, CoopInfoState>(
    builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(text),
          ),
          Text(
            'ดอกเบี้ยร้อยละ ${currency.toStringAsFixed(2)}',
            textAlign: TextAlign.end,
          ),
          sizebox(height: 10),
        ],
      );
    },
  );
}
