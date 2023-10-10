import 'package:dio/dio.dart';

abstract class Faliure {
  final String erorrMessage;

  Faliure(this.erorrMessage);
}

class ServerFaliure extends Faliure {
  ServerFaliure(super.erorrMessage);
  factory ServerFaliure.fromDioErorr(DioError dioErorr) {
    switch (dioErorr.type) {
      case DioErrorType.connectTimeout:
        return ServerFaliure("Connection Timeout With Api Server");

      case DioErrorType.sendTimeout:
        return ServerFaliure("Send Timeout With Api Server");
      case DioErrorType.receiveTimeout:
        return ServerFaliure("Receive Timeout With Api Server");
      case DioErrorType.response:
        return ServerFaliure.fromResponse(dioErorr.response!.statusCode!, dioErorr.response);
      case DioErrorType.cancel:
        return ServerFaliure("Request to Api Server Was Canceld");

      case DioErrorType.other:
        if (dioErorr.message.contains('SocketException')) {
          return ServerFaliure("No InterNet Connection");
        }
        return ServerFaliure("Unexpected Erorr, Plase ty again!");
      default:
        return ServerFaliure("Opps There Was am Erorr");
    }
  }
  factory ServerFaliure.fromResponse(int stutusCode, dynamic response) {
    if (stutusCode == 400 || stutusCode == 401 || stutusCode == 403) {
      return ServerFaliure(response['error']['message']);
    } else if (stutusCode == 404) {
      return ServerFaliure("Your Request Not Found, Please try later!");
    } else if (stutusCode == 500) {
      return ServerFaliure("Internal Server Erorr, Please try later!");
    } else {
      return ServerFaliure("Opps There Was am Erorr");
    }
  }
}
