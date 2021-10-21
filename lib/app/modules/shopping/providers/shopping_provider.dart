import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingProvider extends GetConnect {
  late SharedPreferences shopping;
  @override
  void onInit() async {
    shopping = await SharedPreferences.getInstance();
  }

  setShopping(Product product, int quantity) async {
    return await shopping.setInt("${product.id}", quantity);
  }

  getShopping(int id) {
    return shopping.getInt("$id");
  }

  delShopping(int id) {
    return shopping.remove("$id");
  }

  get clearShopping {
    return shopping.clear();
  }
}
