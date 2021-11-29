import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:i_store/app/config/responses/app_response.dart';
import 'package:i_store/app/data/models/product.dart';

class RemoteDataSources extends GetConnect {
  static const String _baseUrl = "https://the-mobile-store.herokuapp.com/api/phones";
  @override
  void onInit() {
    httpClient.baseUrl = _baseUrl;
  }

  get getAll async {
    final Uri uri = Uri.parse("${httpClient.baseUrl}");
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: productFromJson(appResponse.response),
      );
    } else {
      return appResponse;
    }
  }

  getById(int id) async {
    final Uri uri = Uri.parse("${httpClient.baseUrl}/$id");
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      final json = jsonDecode(appResponse.response);
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: Product.fromJson(json),
      );
    } else {
      return appResponse;
    }
  }
}
