// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.token,
    required this.refreshToken,
    required this.isTestMode,
    required this.isTestAccount,
    required this.passwordReset,
    required this.passwordPolicy,
    required this.memberPerm,
  });

  String? token;
  String? refreshToken;
  bool isTestMode;
  bool isTestAccount;
  bool passwordReset;
  bool passwordPolicy;
  MemberPerm memberPerm;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        refreshToken: json["refreshToken"],
        isTestMode: json["_isTestMode"],
        isTestAccount: json["isTestAccount"],
        passwordReset: json["passwordReset"],
        passwordPolicy: json["passwordPolicy"],
        memberPerm: MemberPerm.fromJson(json["memberPerm"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "_isTestMode": isTestMode,
        "isTestAccount": isTestAccount,
        "passwordReset": passwordReset,
        "passwordPolicy": passwordPolicy,
        "memberPerm": memberPerm.toJson(),
      };
}

class MemberPerm {
  MemberPerm({
    required this.authenLimit,
    required this.summary,
    required this.detail,
  });

  AuthenLimit authenLimit;
  Summary summary;
  Detail detail;

  factory MemberPerm.fromJson(Map<String, dynamic> json) => MemberPerm(
        authenLimit: AuthenLimit.fromJson(json["AUTHEN_LIMIT"]),
        summary: Summary.fromJson(json["summary"]),
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "AUTHEN_LIMIT": authenLimit.toJson(),
        "summary": summary.toJson(),
        "detail": detail.toJson(),
      };
}

class AuthenLimit {
  AuthenLimit({
    required this.maxPinFail,
    required this.maxLoginFail,
    required this.maxLoginFailToLockDevice,
    required this.maxOtpRequest,
    required this.maxOtpIncorrect,
    required this.forceAccountLocked,
  });

  int? maxPinFail;
  int? maxLoginFail;
  int? maxLoginFailToLockDevice;
  int? maxOtpRequest;
  int? maxOtpIncorrect;
  int? forceAccountLocked;

  factory AuthenLimit.fromJson(Map<String, dynamic> json) => AuthenLimit(
        maxPinFail: json["MAX_PIN_FAIL"],
        maxLoginFail: json["MAX_LOGIN_FAIL"],
        maxLoginFailToLockDevice: json["MAX_LOGIN_FAIL_TO_LOCK_DEVICE"],
        maxOtpRequest: json["MAX_OTP_REQUEST"],
        maxOtpIncorrect: json["MAX_OTP_INCORRECT"],
        forceAccountLocked: json["FORCE_ACCOUNT_LOCKED"],
      );

  Map<String, dynamic> toJson() => {
        "MAX_PIN_FAIL": maxPinFail,
        "MAX_LOGIN_FAIL": maxLoginFail,
        "MAX_LOGIN_FAIL_TO_LOCK_DEVICE": maxLoginFailToLockDevice,
        "MAX_OTP_REQUEST": maxOtpRequest,
        "MAX_OTP_INCORRECT": maxOtpIncorrect,
        "FORCE_ACCOUNT_LOCKED": forceAccountLocked,
      };
}

class Detail {
  Detail({
    required this.mastRecSts,
    required this.appRecSts,
    required this.appStopSts,
    required this.appPinAuthFailCount,
    required this.appOtpReqCount,
    required this.appOtpFailCount,
    required this.appBankRecSts,
    required this.appBankStopSts,
    required this.appAccMasterSts,
    required this.appRefNo,
    required this.appDStopSts,
    required this.membNo,
  });

  String? mastRecSts;
  String? appRecSts;
  String? appStopSts;
  int? appPinAuthFailCount;
  int? appOtpReqCount;
  int? appOtpFailCount;
  String? appBankRecSts;
  String? appBankStopSts;
  String? appAccMasterSts;
  String? appRefNo;
  String? appDStopSts;
  String? membNo;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        mastRecSts: json["mastRecSts"],
        appRecSts: json["appRecSts"],
        appStopSts: json["appStopSts"],
        appPinAuthFailCount: json["appPinAuthFailCount"],
        appOtpReqCount: json["appOtpReqCount"],
        appOtpFailCount: json["appOtpFailCount"],
        appBankRecSts: json["appBankRecSts"],
        appBankStopSts: json["appBankStopSts"],
        appAccMasterSts: json["appAccMasterSts"],
        appRefNo: json["appRefNo"],
        appDStopSts: json["appDStopSts"],
        membNo: json["membNo"],
      );

  Map<String, dynamic> toJson() => {
        "mastRecSts": mastRecSts,
        "appRecSts": appRecSts,
        "appStopSts": appStopSts,
        "appPinAuthFailCount": appPinAuthFailCount,
        "appOtpReqCount": appOtpReqCount,
        "appOtpFailCount": appOtpFailCount,
        "appBankRecSts": appBankRecSts,
        "appBankStopSts": appBankStopSts,
        "appAccMasterSts": appAccMasterSts,
        "appRefNo": appRefNo,
        "appDStopSts": appDStopSts,
        "membNo": membNo,
      };
}

class Summary {
  Summary({
    required this.appEnable,
    required this.appTransferMoney,
    required this.coopTransfer,
    required this.bankTransfer,
    required this.status,
    required this.statusDesc,
    required this.devcPinStatus,
  });

  String? appEnable;
  String? appTransferMoney;
  String? coopTransfer;
  String? bankTransfer;
  String? status;
  String? statusDesc;
  String? devcPinStatus;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        appEnable: json["appEnable"],
        appTransferMoney: json["appTransferMoney"],
        coopTransfer: json["coopTransfer"],
        bankTransfer: json["bankTransfer"],
        status: json["status"],
        statusDesc: json["statusDesc"],
        devcPinStatus: json["devcPinStatus"],
      );

  Map<String, dynamic> toJson() => {
        "appEnable": appEnable,
        "appTransferMoney": appTransferMoney,
        "coopTransfer": coopTransfer,
        "bankTransfer": bankTransfer,
        "status": status,
        "statusDesc": statusDesc,
        "devcPinStatus": devcPinStatus,
      };
}
