import 'package:get/get.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';
import 'package:i_store/app/modules/shopping/providers/shopping_provider.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingController>(() => ShoppingController());
    Get.lazyPut<ShoppingProvider>(() => ShoppingProvider());
  }
}
