import 'package:get/get.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingController>(() => ShoppingController());
  }
}
