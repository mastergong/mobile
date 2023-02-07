import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:psucoop_mobile/data/data_providers/data_provider.dart';

import '../../../../presentation/common_widgets/sizebox_widgets.dart';
import '../../../common_widgets/template_screen.dart';
import '../api/model/json/interestLoanModel.dart';
import 'widgets/interest_template.dart';
import '../api/model/bloc/interestBloc.dart';

class InterestDetailScreen extends StatefulWidget {
  //const InterestDetailScreen({Key? key}) : super(key: key);

  String title;
  Color color;
  String rateDate;
  List<Rate> rate;

  InterestDetailScreen(
      {required this.title,
      required this.color,
      required this.rateDate,
      required this.rate});

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
      _date = new DateTime(_date.year + 543, _date.month, _date.day);
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
                    date: _dateFormat.format(_date)),
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
                        Container(
                            width: double.infinity,
                            child: Wrap(
                              children: [
                                for (var detail in widget.rate) ...[
                                  showTextinRow(
                                      context: context,
                                      text:
                                          'ยอดกู้ตั้งแต่ ${detail.rateMinAmount} ขึ้นไป',
                                      currency: double.parse(detail.rate)),
                                ]
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ] // End IF State => CoopGetInterestInfo
            ],
          ),
        ),
      );
    });
  }
}

Widget header(
    {required BuildContext context,
    required String title,
    required Color color,
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
                    icon: new Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  Container(
                    height: 20,
                    width: 5,
                    color: color ?? Color.fromARGB(255, 1, 50, 96),
                  ),
                  sizeboxWidth(5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      '${title}',
                      textScaleFactor: 1.2,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Text(
                'อัพเดตล่าสุดเมื่อ ${date}',
                textScaleFactor: 0.9,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    },
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
