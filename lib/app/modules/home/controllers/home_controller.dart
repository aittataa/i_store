import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/favorite/providers/favorite_provider.dart';
import 'package:i_store/app/modules/shopping/providers/shopping_provider.dart';

import '../providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider _provider = Get.put(HomeProvider());
  final FavoriteProvider _favorite = Get.put(FavoriteProvider());
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

  /// TODO : Favorite Operation
  setFavorite(Product product) async {
    product.updateState();
    return await _favorite.setFavorite(product);
  }

  getFavorite(int id) {
    return _favorite.getFavorite(id);
  }

  delFavorite(int id) {
    return _favorite.delFavorite(id);
  }

  get clearFavorite {
    return _favorite.clearFavorite;
  }

  /// TODO : Shopping Operation
  setShopping(Product product, int quantity) async {
    return await _shopping.setShopping(product, quantity);
  }

  getShopping(int id) {
    return _shopping.getShopping(id);
  }

  delShopping(int id) {
    return _shopping.delShopping(id);
  }

  get clearShopping {
    return _shopping.clearShopping;
  }
}
