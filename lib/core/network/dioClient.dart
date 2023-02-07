import 'dart:async';
import 'package:dio/dio.dart';

// Exception
import '../../data/models_json/resultState.dart';
import '../../data/network/http_url.dart';
import '../local/key_value_storage_base.dart';

const int receiveTimeout = 10000;
const int sendTimeout = 10000;
const int connectionTimeout = 10000;

typedef Create<T> = T Function();

class ClsDio {
  static final Dio _dio = Dio(
    BaseOptions(
        baseUrl: HttpUrl.baseUrl,
        connectTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        responseType: ResponseType.json,
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 404 || (statusCode >= 200 && statusCode < 300)) {
            return true;
          } else {
            return false;
          }
        }),
  )..interceptors.add(AppInterceptor());
}

class DioClient {
  static final DioClient instance = DioClient();

  Future<StatusResponse> fetch({
    required HttpClass url,
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    String token = '';
    String subtoken = '';

    var stgVals = await Future.wait([
      KeyValueStorageBase().getAuthToken(),
      KeyValueStorageBase().getAuthSubToken()
    ]);

    token = stgVals[0];
    subtoken = stgVals[1];

    final requestOptions = RequestOptions(
        baseUrl: HttpUrl.baseUrl,
        path: url.url,
        method: url.method,
        data: data,
        headers: {'Authorization': token, 'subtoken': subtoken},
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return fetchRequestOptions(requestOptions: requestOptions);
  }

  Future<StatusResponse> fetchRequestOptions(
      {required RequestOptions requestOptions}) async {
    final response = await ClsDio._dio.fetch(requestOptions);
    return StatusResponse.fromJson(response.data);
  }
}

class AppInterceptor extends Interceptor {
  AppInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
    this.logPrint = print,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;
  void Function(Object object) logPrint;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    _printKV('uri', options.uri);

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    _printResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response!.data != null) {
      try {
        switch (err.response!.statusCode) {
          case 401: // refresh token
            //handler.resolve(response)
            break;
          case 404:
            var stsRes = StatusResponse.fromJson(
                err.response!.data as Map<String, dynamic>);

            if (stsRes.status.code == -1) {
              _printKV(
                  'stsRes.status.code asaasas   ***** ', stsRes.status.code);
            }

            break;
        }
      } catch (e) {
        _printKV('stsRes.status.code ee => ', e.toString());
      }
    }
    handler.next(err);
  }

  void _printResponse(Response response) {
    _printKV('uri', response.requestOptions.uri);
    if (responseHeader) {
      _printKV('statusCode', response.statusCode);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri);
      }

      logPrint('headers:');
      response.headers.forEach((key, v) => _printKV(' $key', v.join('\r\n\t')));
    }
    if (responseBody) {
      logPrint('Response Text:');
      response.toString().split('\n').forEach(logPrint);
    }
    logPrint('');
  }

  void _printKV(String key, Object? v) {
    logPrint('$key: $v');
  }
}
