import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  final int? code;
  Failure({
    required this.message,
    required this.code,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, required super.code});
  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            message: 'Connection Timeout with ApiServer', code: 0);
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send Timeout with ApiServer', code: 0);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            message: 'Receive Timeout with ApiServer',
            code: error.response?.statusCode ?? 0);
      case DioExceptionType.badCertificate:
        return ServerFailure(
            message: 'Bad Certificate with ApiServer',
            code: error.response?.statusCode ?? 0);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(error.response!);
      case DioExceptionType.cancel:
        return ServerFailure(
            code: error.response?.statusCode ?? 0,
            message: 'Cancel with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure(
            code: error.response?.statusCode ?? 0,
            message: 'Connection Error From the server ,Try Again Later');
      case DioExceptionType.unknown:
        return ServerFailure(
            code: error.response?.statusCode ?? 0,
            message: 'Unexpected Error with server, please try again!');
    }
  }
  factory ServerFailure.fromResponse(Response response) {
    if (response.statusCode == 404) {
      return ServerFailure(
          code: response.statusCode,
          message: response.data is String
              ? response.data
              : response.data["message"] ?? 'Page Not Found');
    } else if (response.statusCode == 500) {
      return ServerFailure(
          code: response.statusCode, message: response.data["message"]);
    } else if (response.statusCode == 400) {
      return ServerFailure(
        code: response.statusCode,
        message: '${response.data["message"]}',
      );
    } else if (response.statusCode == 401) {
      return ServerFailure(
        code: response.statusCode,
        message:
            "انتهت صلاحية الجلسة يرجي اعادة التسجيل مجددا \n your session has been expired please login again",
      );
    } else if (response.statusCode == 403) {
      return ServerFailure(
          code: response.statusCode,
          message: response.data["message"] ?? "Not allawed");
    } else {
      return ServerFailure(
          code: response.statusCode,
          message: 'Unexpected Error, please try again!');
    }
  }
}

class CashingFailure extends Failure {
  CashingFailure({
    required super.message,
    required super.code,
  });
}
