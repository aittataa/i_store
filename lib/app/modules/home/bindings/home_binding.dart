import 'package:get/get.dart';
import 'package:i_store/app/modules/home/providers/home_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<HomeProvider>(
      () => HomeProvider(),
    );
  }
}
