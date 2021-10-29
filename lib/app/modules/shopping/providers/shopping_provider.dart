import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingProvider extends GetConnect {
  late SharedPreferences _shopping;
  @override
  void onInit() async {
    _shopping = await SharedPreferences.getInstance();
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
