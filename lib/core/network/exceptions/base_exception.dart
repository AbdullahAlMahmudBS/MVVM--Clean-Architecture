/**
 * Created by Abdullah on 8/4/25.
 */

abstract class BaseException implements Exception {
  final String message;

  BaseException({this.message = ""});
}