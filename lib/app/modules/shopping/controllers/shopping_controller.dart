import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/providers/home_provider.dart';
import 'package:i_store/app/modules/shopping/providers/shopping_provider.dart';

class ShoppingController extends GetxController {
  final ShoppingProvider _provider = Get.put(ShoppingProvider());
  final HomeProvider _home = Get.put(HomeProvider());

  var productsList = <Product>[].obs;
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    state.value = true;
    var products = await _home.loadData();
    if (products != null) {
      productsList.value = products;
      state.value = false;
    }
  }

  /// TODO : Shopping Operation
  setShopping(Product product, int quantity) async {
    return await _provider.setShopping(product);
  }

  getShopping(int id) {
    return _provider.getShopping(id);
  }

  delShopping(int id) async {
    return await _provider.delShopping(id);
  }

  get clearShopping async {
    return await _provider.clearShopping;
  }
}
