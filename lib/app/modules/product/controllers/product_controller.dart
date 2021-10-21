import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/favorite/providers/favorite_provider.dart';

class ProductController extends GetxController {
  final FavoriteProvider _favorite = Get.put(FavoriteProvider());

  @override
  void onInit() {
    super.onInit();
  }

  setFavorite(Product product) async {
    product.updateState();
    return await _favorite.setFavorite(product);
  }

  getFavorite(int id) => _favorite.getFavorite(id);
}
