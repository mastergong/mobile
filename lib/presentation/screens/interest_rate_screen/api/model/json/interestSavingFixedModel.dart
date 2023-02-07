// To parse this JSON data, do
//
//     final interestSavingFixedModel = interestSavingFixedModelFromJson(jsonString);

import 'dart:convert';

List<InterestSavingFixedModel> interestSavingFixedModelFromJson(String str) =>
    List<InterestSavingFixedModel>.from(
        json.decode(str).map((x) => InterestSavingFixedModel.fromJson(x)));

String interestSavingFixedModelToJson(List<InterestSavingFixedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InterestSavingFixedModel {
  InterestSavingFixedModel({
    required this.rateAcType,
    required this.rateType,
    required this.rateDesc,
    required this.rateDate,
    required this.rateWebSts,
    required this.rates,
  });

  String rateAcType;
  String rateType;
  String rateDesc;
  String rateDate;
  String rateWebSts;
  List<Rate> rates;

  factory InterestSavingFixedModel.fromJson(Map<String, dynamic> json) =>
      InterestSavingFixedModel(
        rateAcType: json["rateAcType"],
        rateType: json["rateType"],
        rateDesc: json["rateDesc"],
        rateDate: json["rateDate"],
        rateWebSts: json["rateWebSts"],
        rates: List<Rate>.from(json["rates"].map((x) => Rate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rateAcType": rateAcType,
        "rateType": rateType,
        "rateDesc": rateDesc,
        "rateDate": rateDate,
        "rateWebSts": rateWebSts,
        "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
      };
}

class Rate {
  Rate({
    required this.rateYearCount,
    required this.ratePercent,
    required this.rate,
    required this.rateBonus,
    required this.rateDueAmount,
  });

  int rateYearCount;
  int ratePercent;
  double rate;
  int rateBonus;
  int rateDueAmount;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        rateYearCount: json["rateYearCount"],
        ratePercent: json["ratePercent"],
        rate: json["rate"].toDouble(),
        rateBonus: json["rateBonus"],
        rateDueAmount: json["rateDueAmount"],
      );

  Map<String, dynamic> toJson() => {
        "rateYearCount": rateYearCount,
        "ratePercent": ratePercent,
        "rate": rate,
        "rateBonus": rateBonus,
        "rateDueAmount": rateDueAmount,
      };
}
