import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/favorite/providers/favorite_provider.dart';
import 'package:i_store/app/modules/home/providers/home_provider.dart';
import 'package:i_store/app/modules/shopping/providers/shopping_provider.dart';

class ProductController extends GetxController {
  final HomeProvider _home = Get.put(HomeProvider());
  final FavoriteProvider _favorite = Get.put(FavoriteProvider());
  final ShoppingProvider _shopping = Get.put(ShoppingProvider());

  @override
  void onInit() {
    super.onInit();
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
    return await _favorite.setFavorite(product);
  }

  getFavorite(int id) {
    return _favorite.getFavorite(id);
  }

  delFavorite(int id) async {
    return await _favorite.delFavorite(id);
  }

  get clearFavorite async {
    return await _favorite.clearFavorite;
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
