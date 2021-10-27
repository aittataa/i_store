import 'package:get/get.dart';
import 'package:i_store/app/modules/detail/controllers/detail_controller.dart';
import 'package:i_store/app/modules/detail/providers/detail_provider.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
    Get.lazyPut<DetailProvider>(() => DetailProvider());
  }
}
