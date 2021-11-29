import 'package:get/get.dart';
import 'package:i_store/app/config/responses/app_response.dart';
import 'package:i_store/app/data/data_sources/local/local_data_sources.dart';
import 'package:i_store/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:i_store/app/data/models/product.dart';

class HomeController extends GetxController {
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

  /// TODO : Favorite Operation
  setFavorite(Product product) async {
    return await _localData.setFavorite(product);
  }

  getFavorite(int id) {
    return _localData.getFavorite(id);
  }

  get clearFavorite async => await _localData.clearFavorite;

  /// TODO : Shopping Operation
  setShopping(Product product, int quantity) async {
    return await _localData.setShopping(product);
  }

  getShopping(int id) {
    return _localData.getShopping(id);
  }

  get clearShopping async => await _localData.clearShopping;
}
