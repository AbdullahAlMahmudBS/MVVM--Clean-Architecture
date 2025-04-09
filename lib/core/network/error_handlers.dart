import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/network/exceptions/app_exception.dart';


/**
 * Created by Abdullah on 8/4/25.
 */

Exception handleError(String error) {
  debugPrint( "Generic Exception ${error}");

  return AppException(message: error);
}

Exception handleDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return AppException(
          message: "Request to API server was cancelled");
    case DioExceptionType.connectionTimeout:
      return AppException(
          message: "Connection timeout with API server");
    case DioExceptionType.unknown:
      return AppException(message: "Something went wrong. Please try again later");
    case DioExceptionType.receiveTimeout:
      return AppException(
          message: "Receive timeout in connection with API server");
    case DioExceptionType.sendTimeout:
      return AppException(message: "Send timeout in connection with API server");
    case DioExceptionType.badResponse:
      return AppException(message: "Bad formatted response");
    case DioExceptionType.badCertificate:
      return AppException(message: "Bad certificate");
    case DioExceptionType.connectionError:
      return AppException(message: "Connection error");
  }

}