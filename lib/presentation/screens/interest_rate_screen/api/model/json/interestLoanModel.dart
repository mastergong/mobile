// To parse this JSON data, do
//
//     final interestLoanModel = interestLoanModelFromJson(jsonString);

import 'dart:convert';

List<InterestLoanModel> interestLoanModelFromJson(String str) =>
    List<InterestLoanModel>.from(
        json.decode(str).map((x) => InterestLoanModel.fromJson(x)));

String interestLoanModelToJson(List<InterestLoanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InterestLoanModel {
  InterestLoanModel({
    required this.rateAcType,
    required this.rateType,
    required this.rateDesc,
    required this.rateDate,
    // required this.rateRefCode,
    // required this.rateRefDate,
    // required this.rateRefRate,
    // required this.rateRefAdd,
    required this.rateCalcType,
    required this.rateWebSts,
    required this.rates,
  });

  String? rateAcType;
  String rateType;
  String rateDesc;
  String rateDate;
  // String? rateRefCode;
  // String? rateRefDate;
  // double? rateRefRate;
  // int? rateRefAdd;
  String? rateCalcType;
  String? rateWebSts;
  List<Rate> rates;

  factory InterestLoanModel.fromJson(Map<String, dynamic> json) =>
      InterestLoanModel(
        rateAcType: json["rateAcType"],
        rateType: json["rateType"],
        rateDesc: json["rateDesc"],
        rateDate: json["rateDate"],
        // rateRefCode: json["rateRefCode"],
        // rateRefDate: json["rateRefDate"],
        // rateRefRate: json["rateRefRate"],
        // rateRefAdd: json["rateRefAdd"],
        rateCalcType: json["rateCalcType"],
        rateWebSts: json["rateWebSts"],
        rates: List<Rate>.from(json["rates"].map((x) => Rate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rateAcType": rateAcType,
        "rateType": rateType,
        "rateDesc": rateDesc,
        "rateDate": rateDate,
        // "rateRefCode": rateRefCode,
        // "rateRefDate": rateRefDate,
        // "rateRefRate": rateRefRate,
        // "rateRefAdd": rateRefAdd,
        "rateCalcType": rateCalcType,
        "rateWebSts": rateWebSts,
        "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
      };
}

class Rate {
  Rate({
    required this.rateMinAmount,
    required this.rate,
    // required this.rateSelf,
  });

  String rateMinAmount;
  String rate;
  // String? rateSelf;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        rateMinAmount: json["rateMinAmount"].toString(),
        rate: json["rate"].toString(),
        // rateSelf: json["rateSelf"],
      );

  Map<String, dynamic> toJson() => {
        "rateMinAmount": rateMinAmount,
        "rate": rate,
        // "rateSelf": rateSelf,
      };
}
