import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends GetConnect {
  // FavoriteProvider._privateConstructor();
  // late FavoriteProvider favorite = FavoriteProvider._privateConstructor();

  //late SharedPreferences favorite;
  @override
  void onInit() async {
    //favorite = await SharedPreferences.getInstance();
  }

  setFavorite(Product product) async {
    final SharedPreferences favorite = await SharedPreferences.getInstance();
    return await favorite.setBool("${product.id}", product.status);
  }

  getFavorite(int id) async {
    final SharedPreferences favorite = await SharedPreferences.getInstance();
    return favorite.getBool("$id");
  }

  delFavorite(int id) async {
    final SharedPreferences favorite = await SharedPreferences.getInstance();
    return favorite.remove("$id");
  }

  get clearFavorite async {
    final SharedPreferences favorite = await SharedPreferences.getInstance();
    return favorite.clear();
  }
}
