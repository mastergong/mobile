import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.coopCode,
    required this.membNo,
    required this.passWd,
    required this.deviceUid,
    required this.appVersion,
  });

  String coopCode;
  String membNo;
  String passWd;
  String deviceUid;
  String appVersion;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        coopCode: json["coopCode"],
        membNo: json["membNo"],
        passWd: json["passWd"],
        deviceUid: json["deviceUid"],
        appVersion: json["appVersion"],
      );

  Map<String, dynamic> toJson() => {
        "coopCode": coopCode,
        "membNo": membNo,
        "passWd": passWd,
        "deviceUid": deviceUid,
        "appVersion": appVersion,
      };
}
