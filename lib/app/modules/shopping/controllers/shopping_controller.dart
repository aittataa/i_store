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
    var products = await _home.loadData();
    if (products == null)
      state.value = true;
    else {
      productsList.value = products;
      state.value = false;
    }
  }

  /// TODO : Shopping Operation
  setShopping(Product product, int quantity) async {
    return await _provider.setShopping(product, quantity);
  }

  getShopping(int id) {
    return _provider.getShopping(id);
  }

  delShopping(int id) {
    return _provider.delShopping(id);
  }

  get clearShopping {
    return _provider.clearShopping;
  }
}
