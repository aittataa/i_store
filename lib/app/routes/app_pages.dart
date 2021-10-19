import 'package:get/get.dart';

import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:i_store/app/modules/favorite/views/favorite_view.dart';
import 'package:i_store/app/modules/home/bindings/home_binding.dart';
import 'package:i_store/app/modules/home/views/home_view.dart';
import 'package:i_store/app/modules/shopping/bindings/shopping_binding.dart';
import 'package:i_store/app/modules/shopping/views/shopping_view.dart';
import 'package:i_store/app/modules/splash/bindings/splash_binding.dart';
import 'package:i_store/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.SHOPPING,
      page: () => ShoppingView(),
      binding: ShoppingBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
  ];
}
