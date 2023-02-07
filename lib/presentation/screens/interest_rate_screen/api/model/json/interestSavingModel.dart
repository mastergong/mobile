// To parse this JSON data, do
//
//     final interestSavingModel = interestSavingModelFromJson(jsonString);

import 'dart:convert';

List<InterestSavingModel> interestSavingModelFromJson(String str) =>
    List<InterestSavingModel>.from(
        json.decode(str).map((x) => InterestSavingModel.fromJson(x)));

String interestSavingModelToJson(List<InterestSavingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InterestSavingModel {
  InterestSavingModel({
    required this.rateAcType,
    required this.rateType,
    required this.rateDesc,
    required this.rateDate,
    required this.rateRefCode,
    required this.rateRefDate,
    required this.rateRefRate,
    required this.rateRefAdd,
    required this.rateCalcType,
    required this.rateWebSts,
    required this.rates,
  });

  String rateAcType;
  String rateType;
  String rateDesc;
  String rateDate;
  String? rateRefCode;
  String? rateRefDate;
  String? rateRefRate;
  String? rateRefAdd;
  String rateCalcType;
  String rateWebSts;
  List<Rate> rates;

  factory InterestSavingModel.fromJson(Map<String, dynamic> json) =>
      InterestSavingModel(
        rateAcType: json["rateAcType"],
        rateType: json["rateType"],
        rateDesc: json["rateDesc"],
        rateDate: json["rateDate"],
        rateRefCode: json["rateRefCode"],
        rateRefDate: json["rateRefDate"],
        rateRefRate: json["rateRefRate"],
        rateRefAdd: json["rateRefAdd"],
        rateCalcType: json["rateCalcType"],
        rateWebSts: json["rateWebSts"],
        rates: List<Rate>.from(json["rates"].map((x) => Rate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rateAcType": rateAcType,
        "rateType": rateType,
        "rateDesc": rateDesc,
        "rateDate": rateDate,
        "rateRefCode": rateRefCode,
        "rateRefDate": rateRefDate,
        "rateRefRate": rateRefRate,
        "rateRefAdd": rateRefAdd,
        "rateCalcType": rateCalcType,
        "rateWebSts": rateWebSts,
        "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
      };
}

class Rate {
  Rate({
    required this.rateMinAmount,
    required this.rate,
    required this.rateSelf,
  });

  double rateMinAmount;
  double rate;
  dynamic rateSelf;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        rateMinAmount: json["rateMinAmount"].toDouble(),
        rate: json["rate"].toDouble(),
        rateSelf: json["rateSelf"],
      );

  Map<String, dynamic> toJson() => {
        "rateMinAmount": rateMinAmount,
        "rate": rate,
        "rateSelf": rateSelf,
      };
}
