// To parse this JSON data, do
//
//     final coopModel = coopModelFromJson(jsonString);

import 'dart:convert';

CoopModel coopModelFromJson(String str) => CoopModel.fromJson(json.decode(str));

String coopModelToJson(CoopModel data) => json.encode(data.toJson());

class CoopModel {
  CoopModel({
    required this.businessApi,
    required this.profile,
    required this.connectTime,
  });

  BusinessApi businessApi;
  Profile profile;
  ConnectTime connectTime;

  factory CoopModel.fromJson(Map<String, dynamic> json) => CoopModel(
        businessApi: BusinessApi.fromJson(json["businessAPI"]),
        profile: Profile.fromJson(json["profile"]),
        connectTime: ConnectTime.fromJson(json["connectTime"]),
      );

  Map<String, dynamic> toJson() => {
        "businessAPI": businessApi.toJson(),
        "profile": profile.toJson(),
        "connectTime": connectTime.toJson(),
      };
}

class BusinessApi {
  BusinessApi({
    required this.appVersion,
    required this.urlHostForApp,
    required this.urlHost,
  });

  String appVersion;
  String urlHostForApp;
  String urlHost;

  factory BusinessApi.fromJson(Map<String, dynamic> json) => BusinessApi(
        appVersion: json["appVersion"],
        urlHostForApp: json["urlHostForApp"],
        urlHost: json["urlHost"],
      );

  Map<String, dynamic> toJson() => {
        "appVersion": appVersion,
        "urlHostForApp": urlHostForApp,
        "urlHost": urlHost,
      };
}

class ConnectTime {
  ConnectTime({
    required this.date,
    required this.time,
  });

  DateTime date;
  String time;

  factory ConnectTime.fromJson(Map<String, dynamic> json) => ConnectTime(
        date: DateTime.parse(json["date"]),
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
      };
}

class Profile {
  Profile({
    required this.coopNameThAbv,
    required this.coopNameThFull,
    required this.coopNameEnAbv,
    required this.coopNameEnFull,
    required this.coopTaxId,
    required this.theme,
  });

  String coopNameThAbv;
  String coopNameThFull;
  String coopNameEnAbv;
  String coopNameEnFull;
  String coopTaxId;
  Theme theme;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        coopNameThAbv: json["coopNameThAbv"],
        coopNameThFull: json["coopNameTHFull"],
        coopNameEnAbv: json["coopNameEnAbv"],
        coopNameEnFull: json["coopNameEnFull"],
        coopTaxId: json["coopTaxId"],
        theme: Theme.fromJson(json["theme"]),
      );

  Map<String, dynamic> toJson() => {
        "coopNameThAbv": coopNameThAbv,
        "coopNameTHFull": coopNameThFull,
        "coopNameEnAbv": coopNameEnAbv,
        "coopNameEnFull": coopNameEnFull,
        "coopTaxId": coopTaxId,
        "theme": theme.toJson(),
      };
}

class Theme {
  Theme({
    required this.coopCode,
    required this.loginBtn,
    required this.contactBtn,
    required this.button,
    required this.reqOtp,
    required this.pinDigit,
    required this.complete,
    required this.header,
    required this.saveBtn,
    required this.statusbar,
  });

  String coopCode;
  String loginBtn;
  String contactBtn;
  String button;
  String reqOtp;
  String pinDigit;
  String complete;
  String header;
  String saveBtn;
  String statusbar;

  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        coopCode: json["coopCode"],
        loginBtn: json["loginBtn"],
        contactBtn: json["contactBtn"],
        button: json["button"],
        reqOtp: json["reqOtp"],
        pinDigit: json["pinDigit"],
        complete: json["complete"],
        header: json["header"],
        saveBtn: json["saveBtn"],
        statusbar: json["statusbar"],
      );

  Map<String, dynamic> toJson() => {
        "coopCode": coopCode,
        "loginBtn": loginBtn,
        "contactBtn": contactBtn,
        "button": button,
        "reqOtp": reqOtp,
        "pinDigit": pinDigit,
        "complete": complete,
        "header": header,
        "saveBtn": saveBtn,
        "statusbar": statusbar,
      };
}
