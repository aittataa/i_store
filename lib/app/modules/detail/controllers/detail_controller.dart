import 'package:get/get.dart';
import 'package:i_store/app/config/responses/app_response.dart';
import 'package:i_store/app/data/data_sources/local/local_data_sources.dart';
import 'package:i_store/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:i_store/app/data/models/product.dart';

class DetailController extends GetxController {
  final RemoteDataSources _remoteData = Get.put(RemoteDataSources());
  final LocalDataSources _localData = Get.put(LocalDataSources());
  var state = false.obs;

  loadById(int id) async {
    state.value = true;
    AppResponse appResponse = await _remoteData.getById(id);
    state.value = false;
    return appResponse;
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
