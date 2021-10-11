import 'package:get/get.dart';

import '../controllers/shopping_controller.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingController>(
      () => ShoppingController(),
    );
  }
}
