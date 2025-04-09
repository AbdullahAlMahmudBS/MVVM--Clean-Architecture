import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_prac_1_eu/core/constants/app_constant.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class RequestHeaderInterceptor extends InterceptorsWrapper{
  var isAuthenticationHeaderRequired = false;
  final String? customContentType;



  RequestHeaderInterceptor(this.isAuthenticationHeaderRequired,
      {this.customContentType});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    var customHeaders = {
      'Content-Type': customContentType ?? 'application/json',
      "Accept-Language": "en",
    };

    if (isAuthenticationHeaderRequired) {
      try {
        final token = AppConstants.token;
        customHeaders["Authorization"] = "Bearer $token";
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return customHeaders;
  }
}