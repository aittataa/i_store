import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/detail/providers/detail_provider.dart';
import 'package:i_store/app/modules/favorite/providers/favorite_provider.dart';
import 'package:i_store/app/modules/shopping/providers/shopping_provider.dart';

class DetailController extends GetxController {
  final DetailProvider _provider = Get.put(DetailProvider());
  final FavoriteProvider _favorite = Get.put(FavoriteProvider());
  final ShoppingProvider _shopping = Get.put(ShoppingProvider());

  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  findByID(int id) async {
    state.value = true;
    var products = await _provider.loadByID(id);
    if (products != null) {
      final Product product = products;
      state.value = false;
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

  delFavorite(int id) {
    return _favorite.delFavorite(id);
  }

  get clearFavorite {
    return _favorite.clearFavorite;
  }

  /// TODO : Shopping Operation
  setShopping(Product product, int quantity) async {
    return await _shopping.setShopping(product);
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
