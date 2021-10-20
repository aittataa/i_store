import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/favorite/providers/favorite_provider.dart';
import 'package:i_store/app/modules/home/providers/home_provider.dart';

class FavoriteController extends GetxController {
  final FavoriteProvider _provider = Get.put(FavoriteProvider());
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

  setFavorite(Product product) async {
    product.updateState();
    return await _provider.setFavorite(product);
  }

  getFavorite(int id) => _provider.getFavorite(id);

  get clearFavorite => {_provider.clearFavorite};
}
