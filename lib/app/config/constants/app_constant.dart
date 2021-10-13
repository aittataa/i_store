import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConstant {
  AppConstant._();
  static const String baseUrl = "https://the-mobile-store.herokuapp.com/api/phones";
  static const Curve curve = Curves.linearToEaseOut;
  static const Transition transitionRoute = Transition.native;

  /// TODO : Durations
  static const Duration durationSplash = Duration(milliseconds: 1500);
  static const Duration durationRoute = Duration(milliseconds: 1000);
}
