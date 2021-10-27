import 'package:get/get.dart';
import 'package:i_store/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:i_store/app/modules/favorite/providers/favorite_provider.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.lazyPut<FavoriteProvider>(() => FavoriteProvider());
  }
}
