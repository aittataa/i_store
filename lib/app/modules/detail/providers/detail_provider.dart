import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/data/models/product.dart';

class DetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppConstant.baseUrl;
  }

  loadByID(int id) async {
    final response = await http.get(Uri.parse("${httpClient.baseUrl}/$id"));
    if (response.statusCode == 200) {
      final String body = response.body;
      final json = jsonDecode(body);
      return Product.fromJson(json);
    } else {
      throw Exception("No Data Found");
    }
  }
}
