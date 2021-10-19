import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingProvider extends GetConnect {
  final GetStorage _store = GetStorage();
  //final SharedPreferences session = SharedPreferences();

  @override
  void onInit() {
    _store.listen(() {
      print("Listen");
    });
  }

  setShopping(Product product) async {
    final SharedPreferences shopping = await SharedPreferences.getInstance();
    return shopping.setBool(product.id.toString(), true);
    //return await _store.write(product.id.toString(), product.id);
  }
}
