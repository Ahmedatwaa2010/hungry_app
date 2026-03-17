import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_erorr.dart';

class ApiExceptions {
  static ApiErorr handleError(DioError erorr) {
    final statusCode = erorr.response?.statusCode;
    final data = erorr.response?.data;
    if (statusCode != null) {
      if (data is Map<String, dynamic> && data['message'] != null) {
        return ApiErorr(message: data['message'], stausCode: statusCode);
      }
    }
    if (statusCode == 302) {
      throw ApiErorr(message: 'This Email Already Taken');
    }
    switch (erorr.type) {
      case DioErrorType.cancel:
        return ApiErorr(message: "Request to API server was cancelled");
      case DioErrorType.connectionTimeout:
        return ApiErorr(message: "Connection timeout with API server");
      case DioErrorType.receiveTimeout:
        return ApiErorr(
          message: "Receive timeout in connection with API server",
        );
      case DioExceptionType.sendTimeout:
        return ApiErorr(message: "send timeout in connection with API server");
      case DioExceptionType.badCertificate:
        return ApiErorr(message: "bad certificate from API server");
      case DioExceptionType.badResponse:
        return ApiErorr(message: "Bad response from API server");

      case DioExceptionType.connectionError:
        return ApiErorr(message: "connection error with API server");

      default:
        DioExceptionType.unknown;
        return ApiErorr(message: "something went wrong");
    }
  }
}
