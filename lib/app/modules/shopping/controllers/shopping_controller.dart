import 'package:get/get.dart';
import 'package:i_store/app/data/data_sources/local/local_data_sources.dart';
import 'package:i_store/app/data/models/product.dart';

class ShoppingController extends GetxController {
  final LocalDataSources _localData = Get.put(LocalDataSources());

  var productsList = <Product>[].obs;
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  /// TODO : Shopping Operation
  setShopping(Product product, int quantity) async {
    return await _localData.setShopping(product);
  }

  getShopping(int id) {
    return _localData.getShopping(id);
  }

  delShopping(int id) async {
    return await _localData.delShopping(id);
  }

  get clearShopping async {
    return await _localData.clearShopping;
  }
}
