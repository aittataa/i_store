import 'package:get/get.dart';
import 'package:i_store/api_service/api_manager.dart';
import 'package:i_store/classes/product.dart';

class ApiController extends GetxController {
  var productsList = <Product>[].obs;

  @override
  void onInit() {
    loadData;
    super.onInit();
  }

  get loadData async {
    var products = await ApiManager.getData();
    if (products != null) productsList.value = products;
  }

  getByID(int id) async {
    return await ApiManager.getByID(id);
  }
}
