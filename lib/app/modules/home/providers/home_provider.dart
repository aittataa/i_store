import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/data/models/product.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppConstant.baseUrl;
  }

  loadData() async {
    final response = await http.get(Uri.parse(AppConstant.baseUrl));
    final String body = response.body;
    // return productFromJson(body);
    final map = jsonDecode(body);
    return List.generate(map.length, (i) => Product.fromJson(map[i]));
  }

  loadByID(int id) async {
    final response = await get("${AppConstant.baseUrl}/$id");
    final String body = response.body;
    return productFromJson(body);
  }
}
