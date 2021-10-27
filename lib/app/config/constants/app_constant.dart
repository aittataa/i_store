import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/themes/app_theme.dart';

class AppConstant {
  AppConstant._();
  static const String baseUrl = "https://the-mobile-store.herokuapp.com/api/phones";

  static const Curve curve = Curves.linearToEaseOut;
  static const Transition transitionRoute = Transition.topLevel;

  /// TODO : Durations
  static const Duration durationSplash = Duration(milliseconds: 1500);
  static const Duration durationRoute = Duration(milliseconds: 100);
  static const Duration durationAnimated = Duration(milliseconds: 1000);

  /// TODO : Screen Size
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;

  /// TODO : BoxShadow
  static BoxShadow boxShadow = BoxShadow(
    color: AppTheme.blackShadowColor.withOpacity(.1),
    blurRadius: 10,
    spreadRadius: .1,
    // blurRadius: 50,
    // spreadRadius: -15,
  );
}
