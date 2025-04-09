/**
 * Created by Abdullah on 8/4/25.
 */

class BaseResponse{
  String? responseCode;
  String? responseMessage;
  dynamic data;

  BaseResponse({this.responseCode, this.responseMessage, this.data});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
    data = json['data'];
  }

}