import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController {
  HomeProvider _provider = Get.find<HomeProvider>();
  var productsList = <Product>[].obs;
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    var products = await _provider.loadData();
    if (products == null)
      state.value = false;
    else {
      productsList.value = products;
      state.value = true;
    }
  }
}
