import 'package:flutter_mvvm_prac_1_eu/core/network/exceptions/base_exception.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class AppException extends BaseException {
  AppException({
    String message = "",
  }) : super(message: message);
}