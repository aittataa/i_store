import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/shopping/providers/shopping_provider.dart';

import '../providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider _provider = Get.put(HomeProvider());
  final ShoppingProvider _shopping = Get.put(ShoppingProvider());

  var productsList = <Product>[].obs;
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    var products = await _provider.loadData();
    if (products == null)
      state.value = true;
    else {
      productsList.value = products;
      state.value = false;
    }
  }

  setShopping(Product product) async {
    return await _shopping.setShopping(product);
  }
}
