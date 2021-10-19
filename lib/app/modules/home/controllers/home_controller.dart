import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/favorite/providers/favorite_provider.dart';

import '../providers/home_provider.dart';

class HomeController extends GetxController {
  final HomeProvider _provider = Get.put(HomeProvider());
  final FavoriteProvider _favorite = Get.put(FavoriteProvider());

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

  setFavorite(Product product) async {
    product.updateState();
    return await _favorite.setFavorite(product);
  }

  getFavorite(int id) async {
    return await _favorite.getFavorite(id);
  }
}
