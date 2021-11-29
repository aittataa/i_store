import 'package:get/get.dart';
import 'package:i_store/app/data/data_sources/local/local_data_sources.dart';
import 'package:i_store/app/data/models/product.dart';

class ProductController extends GetxController {
  final LocalDataSources _localData = Get.put(LocalDataSources());

  @override
  void onInit() {
    super.onInit();
  }

  /// TODO : Favorite Operation
  setFavorite(Product product) async {
    return await _localData.setFavorite(product);
  }

  getFavorite(int id) {
    return _localData.getFavorite(id);
  }

  /// TODO : Shopping Operation
  setShopping(Product product, int quantity) async {
    return await _localData.setShopping(product);
  }

  getShopping(int id) {
    return _localData.getShopping(id);
  }
}
