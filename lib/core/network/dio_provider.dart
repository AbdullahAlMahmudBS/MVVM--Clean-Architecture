import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_prac_1_eu/data/api/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/app_constant.dart';
import 'request_header.dart';


/**
 * Created by Abdullah on 12/10/24.
 */

class DioProvider {
  static const String baseUrl = ApiEndPoints.baseUrl;

  static Dio? _instance;
  DioProvider();

  static const int _maxLineWidth = 120;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      logPrint: (lg) {
        debugPrint(lg.toString());
      },
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: AppConstants.connectionTimeOutInSec),
      receiveTimeout: const Duration(seconds: AppConstants.connectionTimeOutInSec));

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);
      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    } else {
      _instance!.interceptors.clear();
      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  static Dio get tokenClient {
    _addInterceptors();
    return _instance!;
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get dioWithHeaderToken {
    _addInterceptors();
    return _instance!;
  }

  static Dio get dioWithHeaderAuthenticationToken {
    _addInterceptors(
      isAuthenticationHeaderRequired: true,
    );
    return _instance!;
  }

  static Dio get dioMultipartWithHeaderAuthenticationToken {
    _addInterceptors(
        isAuthenticationHeaderRequired: true,
        customContentType: "multipart/form-data");
    return _instance!;
  }

  static Dio get dioMultipartWithoutHeaderAuthenticationToken {
    _addInterceptors(
        isAuthenticationHeaderRequired: false,
        customContentType: "multipart/form-data");
    return _instance!;
  }

  static _addInterceptors(
      {isAuthenticationHeaderRequired = false, customContentType}) {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor(
        isAuthenticationHeaderRequired,
        customContentType: customContentType));
    _instance!.interceptors.add(_prettyDioLogger);
  }

  static String _buildContentType(String version) {
    return "user_defined_content_type+$version";
  }

  DioProvider.setContentType(String version) {
    _instance?.options.contentType = _buildContentType(version);
  }

  DioProvider.setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }
}