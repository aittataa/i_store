import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends GetConnect {
  late SharedPreferences _favorite;
  @override
  void onInit() async {
    _favorite = await SharedPreferences.getInstance();
  }

  setFavorite(Product product) async {
    return await _favorite.setBool(product.id.toString(), product.status);
  }

  getFavorite(int id) {
    return _favorite.getBool(id.toString());
  }

  delFavorite(int id) async {
    return await _favorite.remove(id.toString());
  }

  get clearFavorite async {
    return await _favorite.clear();
  }
}
