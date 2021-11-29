import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSources extends GetConnect {
  late SharedPreferences _favorite;
  late SharedPreferences _shopping;
  @override
  void onInit() async {
    _favorite = await SharedPreferences.getInstance();
    _shopping = await SharedPreferences.getInstance();
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

  setShopping(Product product) async {
    product.updateQuantity;
    return await _shopping.setInt(product.id.toString(), product.quantity);
  }

  getShopping(int id) {
    return _shopping.getInt(id.toString());
  }

  delShopping(int id) async {
    return await _shopping.remove(id.toString());
  }

  get clearShopping async {
    return await _shopping.clear();
  }
}
