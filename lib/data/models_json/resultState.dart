// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';

StatusResponse statusFromJson(String str) =>
    StatusResponse.fromJson(json.decode(str));

String statusToJson(StatusResponse data) => json.encode(data.toJson());

class StatusResponse<T> {
  StatusResponse({
    required this.status,
    required this.data,
  });

  StatusClass status;
  T data;

  factory StatusResponse.fromJson(Map<String, dynamic> json) => StatusResponse(
        status: StatusClass.fromJson(json["status"]),
        data: json["data"] as T,
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
      };
}

class StatusClass {
  StatusClass({
    required this.code,
    required this.description,
  });

  int code;
  String description;

  factory StatusClass.fromJson(Map<String, dynamic> json) => StatusClass(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}
