import 'dart:convert';

Moneyaccount moneyaccountFromJson(String str) =>
    Moneyaccount.fromJson(json.decode(str));

String moneyaccountToJson(Moneyaccount data) => json.encode(data.toJson());

class Moneyaccount {
  Moneyaccount({
    required this.status,
    required this.data,
  });

  Status status;
  Data data;

  factory Moneyaccount.fromJson(Map<String, dynamic> json) => Moneyaccount(
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
    required this.accounts,
  });

  List<Account> accounts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accounts: List<Account>.from(
            json["accounts"].map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accounts": List<dynamic>.from(accounts.map((x) => x.toJson())),
      };
}

class Account {
  Account({
    required this.accMembNo,
    required this.accNo,
    required this.accNoText,
    required this.accName,
    required this.accBal,
    required this.accDesc,
    required this.accType,
  });

  String accMembNo;
  String accNo;
  String accNoText;
  String accName;
  double accBal;
  String accDesc;
  String accType;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        accMembNo: json["accMembNo"],
        accNo: json["accNo"],
        accNoText: json["accNoText"],
        accName: json["accName"],
        accBal: json["accBal"].toDouble(),
        accDesc: json["accDesc"],
        accType: json["accType"],
      );

  Map<String, dynamic> toJson() => {
        "accMembNo": accMembNo,
        "accNo": accNo,
        "accNoText": accNoText,
        "accName": accName,
        "accBal": accBal,
        "accDesc": accDesc,
        "accType": accType,
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
