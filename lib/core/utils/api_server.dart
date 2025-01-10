import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/utils/secure_cashing.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServer {
  static ApiServer? _instance;
  Dio? _dio;
  SecurityContext? securityContext;
  ApiServer._internal() {
    _dio = Dio(
      BaseOptions(baseUrl: baseURl, contentType: "application/json"),
    );
    Future.wait([loadCertificate()]);
    HttpClient httpClient = HttpClient(context: securityContext);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    (_dio!.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () => httpClient;
    // addPrettyDioLogger();
    addDioInterceptors();
  }

  factory ApiServer() {
    _instance ??= ApiServer._internal();
    return _instance!;
  }

  Future<void> loadCertificate() async {
    final ByteData data =
        await rootBundle.load('assets/certificates/_generatorkey.pem');
    SecurityContext secContext = SecurityContext(withTrustedRoots: false);
    secContext.setTrustedCertificatesBytes(data.buffer.asInt8List());
    securityContext = secContext;
  }

  void addPrettyDioLogger() => _dio!.interceptors
      .add(PrettyDioLogger(requestHeader: true, requestBody: true));
  void addDioInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String token = await SecureCashing.getSecuerString(
              key: GetStoreageKey.loginToken);
          options.headers["Authorization"] = "Bearer $token";
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.headers['set-cookie'] != null) {
            final cookies = response.headers['set-cookie'];

            String refreshToken = extractRefreshToken(cookies!.first);

            // You can save these cookies for future requests if needed
            SecureCashing.setSecuerString(
              key: GetStoreageKey.refreshToken,
              value: refreshToken,
            );
          }
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            final newAccessToken = await refreshToken();
            if (newAccessToken != null) {
              // print(
              //     'refresh is done========================================================');
              _dio!.options.headers["Authorization"] = "Bearer $newAccessToken";
              // return handler.resolve(await _dio!.fetch(error.requestOptions));
              final requestOptions = error.requestOptions;

              // Check if the request contains FormData
              if (requestOptions.data is FormData) {
                // Fetch or recreate the FormData here
                FormData newFormData =
                    await _createFormDataFromRequest(requestOptions.data);

                // Update the request options with the new FormData
                requestOptions.data = newFormData;
              }

              // Retry the request with the new options
              return handler.resolve(await _dio!.fetch(requestOptions));
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<String?> refreshToken() async {
    try {
      String refreshToken =
          await SecureCashing.getSecuerString(key: GetStoreageKey.refreshToken);
      final cookie = 'refreshToken=$refreshToken';
      _dio?.options.headers['Cookie'] = cookie;
      final response = await _dio!.get(
          '/api/Auth/refreshToken'); //url of refresh token and add old token
      final newAccessToken =
          response.data['token']; //name of refresh token in body
      SecureCashing.setSecuerString(
        key: GetStoreageKey.loginToken,
        value: newAccessToken,
      );
      return newAccessToken;
    } catch (error) {
      // navigateToLogin();
    }
    return null;
  }

  // void setDio(Dio dio) => _dio = dio;
  // Dio get dio => _dio!;
  Future<Map<String, dynamic>> get({
    required String uri,
    // String? token,
    String? lang,
    Map<String, String>? additionalHeaders,
  }) async {
    Map<String, String> headers = {
      "lang": "ar",
    };
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    _dio!.options.headers.addAll(headers);

    var response = await _dio!.get(uri);
    return response.data;
  }

  Future<bool> cheekInterentConnection() async {
    try {
      final foo = await InternetAddress.lookup('google.com');
      return foo.isNotEmpty && foo[0].rawAddress.isNotEmpty ? true : false;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    String? lang,
    // String? platform,
    Map<String, String>? additionalHeaders,
    Object? data,
    // String? phoneNumber,
  }) async {
    Map<String, String> headers = {
      "lang": "ar",
    };
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    _dio!.options.headers.addAll(headers);
    var response = await _dio!.post(
      endPoint,
      data: data,
    );

    if (response.data is String) {
      return {"message": response.data};
    }
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, String>? additionalHeaders,
    Object? data,
  }) async {
    Map<String, String> headers = {
      "lang": "ar",
    };
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    _dio!.options.headers.addAll(headers);
    var response = await _dio!.delete(
      endPoint,
      data: data,
    );
    if (response.data is String) {
      return {"message": response.data};
    }
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, String>? additionalHeaders,
    Object? data,
  }) async {
    Map<String, String> headers = {
      "lang": "en",
    };
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    _dio!.options.headers.addAll(headers);
    var response = await _dio!.put(
      endPoint,
      data: data,
    );

    if (response.data is String) {
      return {"message": response.data};
    }
    return response.data;
  }
}

//------------------------------------------------------------------------------
String extractRefreshToken(String input) {
  final regex = RegExp(r'refreshToken=([^]+); expires=');
  final match = regex.firstMatch(input);

  if (match != null) {
    return match.group(1)!; // Return the extracted token
  }

  return ''; // Return an empty string if not found
}

/// Helper method to create a new FormData instance from the original
Future<FormData> _createFormDataFromRequest(dynamic originalData) async {
  if (originalData is FormData) {
    // Recreate the FormData fields
    Map<String, dynamic> fields = {};
    for (var field in originalData.fields) {
      fields[field.key] =
          field.value; // You might need to handle files separately
    }

    // If there are files, recreate them
    for (var file in originalData.files) {
// returning a new instance of the same object. This is useful if your request failed and you wish to retry it
      MultipartFile imageFile = file.value.clone(); 
      fields[file.key] = imageFile;
    }
    FormData newFormData = FormData.fromMap(fields);
    return newFormData;
  }
  return FormData(); // Return an empty FormData if it's not the expected type
}