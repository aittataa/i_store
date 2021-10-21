import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/favorite/providers/favorite_provider.dart';
import 'package:i_store/app/modules/home/providers/home_provider.dart';
import 'package:i_store/app/modules/shopping/providers/shopping_provider.dart';

class FavoriteController extends GetxController {
  final FavoriteProvider _provider = Get.put(FavoriteProvider());
  final HomeProvider _home = Get.put(HomeProvider());
  final ShoppingProvider _shopping = Get.put(ShoppingProvider());

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

  /// TODO : Favorite Operation
  setFavorite(Product product) async {
    product.updateState();
    return await _provider.setFavorite(product);
  }

  getFavorite(int id) {
    return _provider.getFavorite(id);
  }

  delFavorite(int id) {
    return _provider.delFavorite(id);
  }

  get clearFavorite {
    return _provider.clearFavorite;
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
