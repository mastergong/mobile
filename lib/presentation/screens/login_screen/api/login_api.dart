import 'package:dio/dio.dart';
import 'package:psucoop_mobile/data/models_json/resultState.dart';

import '../../../../../core/network/dioClient.dart';
import '../../../../../data/network/http_url.dart';
import '../model/json/login.dart';
import '../model/json/login_request.dart';

class LoginApi {
  LoginApi();

  Future<StatusResponse> logIn(
      {required String membNo,
      required String membPwd,
      String coopCode = '0001'}) async {
    var request = LoginRequest(
      coopCode: coopCode,
      membNo: membNo,
      passWd: membPwd,
      deviceUid: '__DEBUGGING_VIA_POSTMAN__',
      appVersion: '1.3.x',
    ).toJson();

    return await DioClient.instance.fetch(url: HttpUrl.login, data: request);
  }

  void logOut() async {
    try {} catch (e) {
      rethrow;
    }
  }
}
