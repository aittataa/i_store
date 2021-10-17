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
    final response = await http.get(Uri.parse("${httpClient.baseUrl}"));
    if (response.statusCode == 200) {
      final String body = response.body;
      return productFromJson(body);
    } else {
      throw Exception("No Data Found");
    }
  }

  loadByID(int id) async {
    final response = await get("${AppConstant.baseUrl}/$id");
    final String body = response.body;
    return productFromJson(body);
  }
}
