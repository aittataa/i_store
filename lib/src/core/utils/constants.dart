import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constant {
  static int selectedIndex;
  static int pageIndex;
  static const int itemCount = 25;
  static const Duration duration = Duration(milliseconds: 1500);
  static const Curve curve = Curves.linearToEaseOut;
  static final double screenWidth = Get.size.width;
  static final double screenHeight = Get.size.height;

  static const boxShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 90,
    spreadRadius: -15,
  );

  static gridDelegate({int crossAxisCount = 1, double childAspectRatio = 1}) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    );
  }
}
