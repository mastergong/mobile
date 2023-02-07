import '../../../../core/local/key_value_storage_base.dart';
import '../../../../core/network/dioClient.dart';
import '../../../../data/network/http_url.dart';

Future<void> evenTokenExpCheck() async {
  var refresh = await KeyValueStorageBase().getRefreshToken();

  Map<String, dynamic> param = {'refreshToken': refresh};
  DioClient.instance
      .fetch(url: HttpUrl.refreshToken, data: param)
      .then((value) {
    if (value.status.code == 0) {
      KeyValueStorageBase().setAuthToken(value.data['token']);
    }
  });
}
