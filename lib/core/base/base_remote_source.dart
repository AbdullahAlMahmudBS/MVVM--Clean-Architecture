import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../network/dio_provider.dart';
import '../network/error_handlers.dart';
import '../network/exceptions/base_exception.dart';
import 'base_response.dart';
/**
 * Created by Abdullah on 8/4/25.
 */

abstract class BaseRemoteSource{
  Dio get dioClient => DioProvider.dioWithHeaderToken;
  Dio get dioClientWithAuth => DioProvider.dioWithHeaderAuthenticationToken;
  Dio get dioMultipartClientWithAuth =>
      DioProvider.dioMultipartWithHeaderAuthenticationToken;
  Dio get dioMultipartClientWithoutAuth =>
      DioProvider.dioMultipartWithoutHeaderAuthenticationToken;

  Future<BaseResponse> callApiWithErrorParser<T>(
      Future<Response<T>> request,
      ) async {
    try {
      Response<T> response = await request;

      BaseResponse baseResponse = BaseResponse();

      try {

        Map<String, dynamic> responseData = {
          'data': response.data
        };

        baseResponse = BaseResponse.fromJson(responseData);
      } catch (e) {
        debugPrint('Error parsing response: $e');
      }


      return baseResponse;
    } on DioException catch (dioError) {
        Exception exception = handleDioError(dioError);
      debugPrint("Repository Error Message:  |::::::::|  ${(exception as BaseException).message} ");
      debugPrint("Repository Error Trace:  |::::::::|  $exception ");
      throw exception;
    } catch (error) {
      debugPrint( "Remote:Generic:: $error");
      if (error is BaseException) {
        rethrow;
      }
      throw handleError("$error");
    }
  }


}