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
    state.value = true;
    var products = await _home.loadData();
    if (products != null) {
      productsList.value = products;
      state.value = false;
    }
  }

  findByID(int id) async {
    var products = await _home.loadByID(id);
    if (products != null) {
      final Product product = products;
      return product;
    }
  }

  /// TODO : Favorite Operation
  setFavorite(Product product) async {
    return await _provider.setFavorite(product);
  }

  getFavorite(int id) {
    return _provider.getFavorite(id);
  }

  delFavorite(int id) async {
    return await _provider.delFavorite(id);
  }

  get clearFavorite async {
    return await _provider.clearFavorite;
  }

  /// TODO : Shopping Operation
  setShopping(Product product, int quantity) async {
    return await _shopping.setShopping(product);
  }

  getShopping(int id) {
    return _shopping.getShopping(id);
  }

  delShopping(int id) async {
    return await _shopping.delShopping(id);
  }

  get clearShopping async {
    return await _shopping.clearShopping;
  }
}
