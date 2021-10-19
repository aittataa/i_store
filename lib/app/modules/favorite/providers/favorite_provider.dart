import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends GetConnect {
  late SharedPreferences favorite;
  @override
  void onInit() async {
    favorite = await SharedPreferences.getInstance();
  }

  setFavorite(Product product) async {
    return await favorite.setBool("${product.id}", product.status);
  }

  getFavorite(int id) {
    return favorite.getBool("$id");
  }

  get clearFavorite {
    favorite.clear();
  }
}
