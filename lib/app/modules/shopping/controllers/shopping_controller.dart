import 'package:get/get.dart';
import 'package:i_store/app/config/responses/app_response.dart';
import 'package:i_store/app/data/data_sources/local/local_data_sources.dart';
import 'package:i_store/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:i_store/app/data/models/product.dart';

class ShoppingController extends GetxController {
  final RemoteDataSources _remoteData = Get.put(RemoteDataSources());
  final LocalDataSources _localData = Get.put(LocalDataSources());

  var appResponse = AppResponse().obs;
  var productsList = <Product>[].obs;
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadAll;
  }

  get _loadAll async {
    state.value = true;
    final AppResponse response = await _remoteData.getAll;
    if (response.success) {
      productsList.value = response.response;
    }
    appResponse.value = response;
    state.value = false;
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
