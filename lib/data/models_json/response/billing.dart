// To parse this JSON data, do
//
//     final billing = billingFromJson(jsonString);

import 'dart:convert';

Billing billingFromJson(String str) => Billing.fromJson(json.decode(str));

String billingToJson(Billing data) => json.encode(data.toJson());

class Billing {
  Billing({
    required this.status,
    required this.data,
  });

  Status status;
  Data data;

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
        status: Status.fromJson(json["status"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.dueDate,
    required this.arrearsNotify,
    required this.items,
    required this.summary,
  });

  String dueDate;
  bool arrearsNotify;
  List<Item> items;
  Summary summary;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dueDate: json["dueDate"],
        arrearsNotify: json["arrearsNotify"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        summary: Summary.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
        "dueDate": dueDate,
        "arrearsNotify": arrearsNotify,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "summary": summary.toJson(),
      };
}

class Item {
  Item({
    required this.detail,
    required this.periods,
    required this.amount,
    required this.interest,
    required this.totalAmount,
    required this.status,
    required this.arrearsAmount,
  });

  String detail;
  String periods;
  String amount;
  String interest;
  String totalAmount;
  String status;
  String arrearsAmount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        detail: json["detail"],
        periods: json["periods"],
        amount: json["amount"],
        interest: json["interest"],
        totalAmount: json["totalAmount"],
        status: json["status"],
        arrearsAmount: json["arrearsAmount"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "periods": periods,
        "amount": amount,
        "interest": interest,
        "totalAmount": totalAmount,
        "status": status,
        "arrearsAmount": arrearsAmount,
      };
}

class Summary {
  Summary({
    required this.detail,
    required this.amount,
    required this.arrears,
    required this.interest,
    required this.totalAmount,
  });

  String detail;
  String amount;
  String arrears;
  String interest;
  String totalAmount;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        detail: json["detail"],
        amount: json["amount"],
        arrears: json["arrears"],
        interest: json["interest"],
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "amount": amount,
        "arrears": arrears,
        "interest": interest,
        "totalAmount": totalAmount,
      };
}

class Status {
  Status({
    required this.code,
    required this.description,
  });

  int code;
  String description;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}
