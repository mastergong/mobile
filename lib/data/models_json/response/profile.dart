import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.status,
    required this.data,
  });

  Status status;
  Data data;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    required this.profile,
  });

  ProfileClass profile;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        profile: ProfileClass.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
      };
}

class ProfileClass {
  ProfileClass({
    required this.mastMembNo,
    required this.mastFname,
    required this.mastName,
    required this.mastEngName,
    required this.mastEngLname,
    required this.mastPosition,
    required this.mastSalary,
    required this.mastSalary2,
    required this.mastCardId,
    required this.mastBirthYmd,
    required this.mastAddr,
    required this.mastZip,
    required this.mastAddr2,
    required this.mastZip2,
    required this.mastMobile,
    required this.mastTel,
    required this.mastEmail,
    required this.mastYmdIn,
    required this.mastMembDept,
    required this.mastPaidPerd,
    required this.mastRecSts,
    required this.mastYmdOut,
    required this.mastPaidShr,
    required this.mastIntComm,
    required this.mastIntEmrg,
    required this.mastIntSpec,
    required this.mastPromInt,
    required this.mastMonthShr,
    required this.mastPaySts,
    required this.mastPayBankNo,
    required this.mastPaiddivdSts,
    required this.mastRecvBankNo,
    required this.deptName,
    required this.unitName,
    required this.stsTypeDesc,
  });

  String mastMembNo;
  String mastFname;
  String mastName;
  String mastEngName;
  String mastEngLname;
  String mastPosition;
  int mastSalary;
  int mastSalary2;
  String mastCardId;
  String mastBirthYmd;
  String mastAddr;
  String mastZip;
  String mastAddr2;
  String mastZip2;
  String mastMobile;
  String mastTel;
  String mastEmail;
  String mastYmdIn;
  String mastMembDept;
  int mastPaidPerd;
  String mastRecSts;
  String mastYmdOut;
  int mastPaidShr;
  int mastIntComm;
  int mastIntEmrg;
  double mastIntSpec;
  int mastPromInt;
  int mastMonthShr;
  String mastPaySts;
  String mastPayBankNo;
  String mastPaiddivdSts;
  String mastRecvBankNo;
  String deptName;
  String unitName;
  String stsTypeDesc;

  factory ProfileClass.fromJson(Map<String, dynamic> json) => ProfileClass(
        mastMembNo: json["mastMembNo"],
        mastFname: json["mastFname"],
        mastName: json["mastName"],
        mastEngName: json["mastEngName"],
        mastEngLname: json["mastEngLname"],
        mastPosition: json["mastPosition"],
        mastSalary: json["mastSalary"],
        mastSalary2: json["mastSalary2"],
        mastCardId: json["mastCardId"],
        mastBirthYmd: json["mastBirthYmd"],
        mastAddr: json["mastAddr"],
        mastZip: json["mastZip"],
        mastAddr2: json["mastAddr2"],
        mastZip2: json["mastZip2"],
        mastMobile: json["mastMobile"],
        mastTel: json["mastTel"],
        mastEmail: json["mastEmail"],
        mastYmdIn: json["mastYmdIn"],
        mastMembDept: json["mastMembDept"],
        mastPaidPerd: json["mastPaidPerd"],
        mastRecSts: json["mastRecSts"],
        mastYmdOut: json["mastYmdOut"],
        mastPaidShr: json["mastPaidShr"],
        mastIntComm: json["mastIntComm"],
        mastIntEmrg: json["mastIntEmrg"],
        mastIntSpec: json["mastIntSpec"].toDouble(),
        mastPromInt: json["mastPromInt"],
        mastMonthShr: json["mastMonthShr"],
        mastPaySts: json["mastPaySts"],
        mastPayBankNo: json["mastPayBankNo"],
        mastPaiddivdSts: json["mastPaiddivdSts"],
        mastRecvBankNo: json["mastRecvBankNo"],
        deptName: json["deptName"],
        unitName: json["unitName"],
        stsTypeDesc: json["stsTypeDesc"],
      );

  Map<String, dynamic> toJson() => {
        "mastMembNo": mastMembNo,
        "mastFname": mastFname,
        "mastName": mastName,
        "mastEngName": mastEngName,
        "mastEngLname": mastEngLname,
        "mastPosition": mastPosition,
        "mastSalary": mastSalary,
        "mastSalary2": mastSalary2,
        "mastCardId": mastCardId,
        "mastBirthYmd": mastBirthYmd,
        "mastAddr": mastAddr,
        "mastZip": mastZip,
        "mastAddr2": mastAddr2,
        "mastZip2": mastZip2,
        "mastMobile": mastMobile,
        "mastTel": mastTel,
        "mastEmail": mastEmail,
        "mastYmdIn": mastYmdIn,
        "mastMembDept": mastMembDept,
        "mastPaidPerd": mastPaidPerd,
        "mastRecSts": mastRecSts,
        "mastYmdOut": mastYmdOut,
        "mastPaidShr": mastPaidShr,
        "mastIntComm": mastIntComm,
        "mastIntEmrg": mastIntEmrg,
        "mastIntSpec": mastIntSpec,
        "mastPromInt": mastPromInt,
        "mastMonthShr": mastMonthShr,
        "mastPaySts": mastPaySts,
        "mastPayBankNo": mastPayBankNo,
        "mastPaiddivdSts": mastPaiddivdSts,
        "mastRecvBankNo": mastRecvBankNo,
        "deptName": deptName,
        "unitName": unitName,
        "stsTypeDesc": stsTypeDesc,
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
