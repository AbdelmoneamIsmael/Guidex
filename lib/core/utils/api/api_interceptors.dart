import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Getx;
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/utils/cache_helper.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
      printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true));
  final Dio dio;

  LoggerInterceptor({required this.dio});
  @override
  Future<void> onError(
      DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      String token = await refreshToken();
      if (token.isNotEmpty) {
        error.requestOptions.headers["Authorization"] = "Bearer $token";

        try {
          final newResponse = await dio.fetch(error.requestOptions);
          return handler.resolve(newResponse);
        } catch (e) {
          Getx.Get.toNamed(Routes.loginScreen);
          return handler.next(error);
        }
      } else {
        Getx.Get.toNamed(Routes.loginScreen);

        return handler.next(error);
      }
    }
    handler.next(error); //Continue with the Error
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token =
        await CacheHelper.getSecuerString(key: GetStoreageKey.accessToken);
    String? lang = await CacheHelper.getSecuerString(key: GetStoreageKey.lang);

    options.headers["Authorization"] = "Bearer $token";
    options.headers["Accept-Language"] = lang ?? "ar-EG";
    final requestPath = options.path;
    log(options.path.toString());
    logger.i('${options.method} request ==> $requestPath'); //Info log
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('STATUSCODE: ${response.statusCode} \n '
        'STATUSMESSAGE: ${response.statusMessage} \n'
        'HEADERS: ${response.headers} \n'
        'Data: ${response.data}'); // Debug log
    handler.next(response); // continue with the Response
  }

  Future<String> refreshToken() async {
    try {
      String? accessToken =
          await CacheHelper.getSecuerString(key: GetStoreageKey.accessToken);
      String refreshToken =
          await CacheHelper.getSecuerString(key: GetStoreageKey.refreshToken);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
        'Cookie': 'refreshToken=$refreshToken',
      };
      String url = "/api/Authentication/RefreshToken";
      dio.options.headers = headers;
      var response = await dio.get(
        url,
      );

      if (response.statusCode == 200) {
        await CacheHelper.setSecuerString(
            key: GetStoreageKey.accessToken, value: response.data["token"]);
        return response.data["token"];
      } else {
        await CacheHelper.setSecuerString(
            key: GetStoreageKey.accessToken, value: "");
        await CacheHelper.setSecuerString(
            key: GetStoreageKey.refreshToken, value: "");
        // PageRoutes.router.go(PagesKeys.loginPage);
        return "";
      }
    } on Exception catch (e) {
      debugPrint(e.toString());

      // PageRoutes.router.go(PagesKeys.loginPage);
      // rethrow;
      return "";
    }
  }
}
