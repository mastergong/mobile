import 'dart:convert';

import '../../../../core/network/dioClient.dart';
import '../../../../data/models_json/resultState.dart';
import '../../../../data/network/http_url.dart';

class ShareDividenApi {
  ShareDividenApi();
  DioClient dioClient = DioClient();

  Future<StatusResponse> fetch() async {
    try {
      final response = await dioClient.fetch(url: HttpUrl.dividend);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
