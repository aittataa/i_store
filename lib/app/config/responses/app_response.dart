import 'dart:io';


class AppResponse {
  final bool success;
  final String? messageServer;
  final String? messageUser;
  final dynamic response;

  const AppResponse({
    this.success = false,
    this.messageServer,
    this.messageUser,
    this.response,
  });

  static requestResponse(response) {
    try {
      switch (response.statusCode) {
        case 200:
          return AppResponse(
            success: true,
            messageServer: response.reasonPhrase,
            messageUser: response.reasonPhrase,
            response: response.body,
          );
        case 201:
          return AppResponse(
            success: true,
            messageServer: response.reasonPhrase,
            messageUser: response.reasonPhrase,
            response: response.body,
          );
        case 400:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Bad Request",
            response: response.body,
          );
        case 401:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Unauthorized",
            response: response.body,
          );
        case 404:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Not Found",
            response: response.body,
          );
        case 405:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Method Not Allowed",
            response: response.body,
          );
        case 408:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Request Timeout",
            response: response.body,
          );
        case 408:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Request Timeout",
            response: response.body,
          );
        case 440:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Login Time-out",
            response: response.body,
          );
        case 500:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Internal Server Error",
            response: response.body,
          );
        case 501:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Not Implemented",
            response: response.body,
          );
        case 502:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Bad Gateway",
            response: response.body,
          );
        case 503:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Service Unavailable",
            response: response.body,
          );
        case 504:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Gateway Timeout",
            response: response.body,
          );
        case 511:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Network Authentication Required",
            response: response.body,
          );
        default:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Something Wrong",
            response: response.body,
          );
      }
    } on SocketException {
      return AppResponse(
        success: false,
        messageServer: response.reasonPhrase,
        response: "No Internet",
      );
    } on FormatException {
      return AppResponse(
        success: false,
        messageServer: response.reasonPhrase,
        response: "Bad Response",
      );
    } on HttpException {
      return AppResponse(
        success: false,
        messageServer: response.reasonPhrase,
        response: "Server not responding",
      );
    }
  }
}
