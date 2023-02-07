// To parse this JSON data, do
//
//     final shareDividenData = shareDividenDataFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ShareDividenData> shareDividenDataFromJson(String str) =>
    List<ShareDividenData>.from(
        json.decode(str).map((x) => ShareDividenData.fromMap(x)));

String shareDividenDataToJson(List<ShareDividenData> data) {
  //Original
  // return json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
  //
  JsonEncoder oEncoder = const JsonEncoder.withIndent('  ');
  return oEncoder.convert(List<dynamic>.from(data.map((x) => x.toMap())));
}

class ShareDividens {
  List<ShareDividenData> dividens = [];

  ShareDividens.fromList({required this.dividens});

  ShareDividens({required List<dynamic> rawDividens}) {
    if (rawDividens.length > 0) {
      rawDividens.forEach(
          (dividen) => dividens.add(ShareDividenData.fromMap(dividen)));
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return shareDividenDataToJson(dividens);
  }

  // List<List<Map<String, dynamic>>> toList() {
  //   List<List<Map<String, dynamic>>> retVal = [];
  //   dividens.forEach((dividen) => retVal.add(dividen.toList()));
  //   return retVal;
  // }
}

class ShareDividenData {
  ShareDividenData({
    required this.dividendYear,
    required this.dividendRate,
    required this.dividendAmount,
    required this.averageReturnRate,
    required this.averageReturnAmount,
    required this.totalAmount,
    required this.receiveDate,
    required this.status,
  });

  final String dividendYear;
  final String dividendRate;
  final String dividendAmount;
  final String averageReturnRate;
  final String averageReturnAmount;
  final String totalAmount;
  final String receiveDate;
  final List<dynamic> status;

  ShareDividenData copyWith({
    required String dividendYear,
    required String dividendRate,
    required String dividendAmount,
    required String averageReturnRate,
    required String averageReturnAmount,
    required String totalAmount,
    required String receiveDate,
    required List<dynamic> status,
  }) =>
      ShareDividenData(
        dividendYear: dividendYear,
        dividendRate: dividendRate,
        dividendAmount: dividendAmount,
        averageReturnRate: averageReturnRate,
        averageReturnAmount: averageReturnAmount,
        totalAmount: totalAmount,
        receiveDate: receiveDate,
        status: status,
      );

  factory ShareDividenData.fromMap(Map<String, dynamic> json) =>
      ShareDividenData(
        dividendYear: json["dividendYear"],
        dividendRate: json["dividendRate"],
        dividendAmount: json["dividendAmount"],
        averageReturnRate: json["averageReturnRate"],
        averageReturnAmount: json["averageReturnAmount"],
        totalAmount: json["totalAmount"],
        receiveDate: json["receiveDate"],
        status: List<dynamic>.from(json["status"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "dividendYear": dividendYear,
        "dividendRate": dividendRate,
        "dividendAmount": dividendAmount,
        "averageReturnRate": averageReturnRate,
        "averageReturnAmount": averageReturnAmount,
        "totalAmount": totalAmount,
        "receiveDate": receiveDate,
        "status": List<dynamic>.from(status.map((x) => x)),
      };

  // List<Map<String, dynamic>> toList() {
  //   return [
  //     {"name": "dividendYear", "value": dividendYear},
  //     {"name": "dividendRate", "value": dividendRate},
  //     {"name": "dividendAmount", "value": dividendAmount},
  //     {"name": "averageReturnRate", "value": averageReturnRate},
  //     {"name": "averageReturnAmount", "value": averageReturnAmount},
  //     {"name": "totalAmount", "value": totalAmount},
  //     {"name": "receiveDate", "value": receiveDate},
  //     {"name": "status", "value": status},
  //   ];
  // }
}
