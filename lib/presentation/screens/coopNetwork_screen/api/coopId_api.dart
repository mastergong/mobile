import '../../../../core/network/dioClient.dart';
import '../../../../data/models_json/resultState.dart';
import '../../../../data/network/http_url.dart';

class COOPIDApi {
  COOPIDApi();
  DioClient dioClient = DioClient();

  Future<StatusResponse> getCoopId({required String coopCode}) async {
    return await dioClient.fetch(url: HttpUrl.startAppApi(coopCode: coopCode));
  }
}
