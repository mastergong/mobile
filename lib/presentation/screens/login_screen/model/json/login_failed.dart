// To parse this JSON data, do
//
//     final loginfailed = loginfailedFromJson(jsonString);

import 'dart:convert';

Loginfailed loginfailedFromJson(String str) =>
    Loginfailed.fromJson(json.decode(str));

String loginfailedToJson(Loginfailed data) => json.encode(data.toJson());

class Loginfailed {
  Loginfailed({
    required this.consecutiveLock,
    required this.consecutiveFailMax,
    required this.consecutiveFailType,
  });

  int consecutiveLock;
  int consecutiveFailMax;
  String consecutiveFailType;

  factory Loginfailed.fromJson(Map<String, dynamic> json) => Loginfailed(
        consecutiveLock: json["consecutiveLock"],
        consecutiveFailMax: json["consecutiveFailMax"],
        consecutiveFailType: json["consecutiveFailType"],
      );

  Map<String, dynamic> toJson() => {
        "consecutiveLock": consecutiveLock,
        "consecutiveFailMax": consecutiveFailMax,
        "consecutiveFailType": consecutiveFailType,
      };
}
