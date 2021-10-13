import 'package:get/get.dart';
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/data/models/product.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppConstant.baseUrl;
  }

  loadData() async {
    final response = await get(AppConstant.baseUrl);
    final String body = response.body;
    return productFromJson(body);
  }

  loadByID(int id) async {
    final response = await get("${AppConstant.baseUrl}/$id");
    final String body = response.body;
    return productFromJson(body);
  }
}
