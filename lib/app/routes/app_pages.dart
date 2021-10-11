import 'package:get/get.dart';

import 'package:i_store/app/modules/home/bindings/home_binding.dart';
import 'package:i_store/app/modules/home/views/home_view.dart';
import 'package:i_store/app/modules/shopping/bindings/shopping_binding.dart';
import 'package:i_store/app/modules/shopping/views/shopping_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SHOPPING,
      page: () => ShoppingView(),
      binding: ShoppingBinding(),
    ),
  ];
}
