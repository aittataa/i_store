import 'package:flutter/material.dart';
import 'package:i_store/classes/categories.dart';

class Constant {
  static int selectedIndex;
  static int pageIndex;
  static const int itemCount = 25;
  static const Duration duration = Duration(milliseconds: 1500);
  static const Curve curve = Curves.linearToEaseOut;

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

Color mainColor = Color(0xFFF0F0F0);

//get getRandomColor => Color(Random().nextInt(0xFFFFFFFF)).withAlpha(0xFF).value;

List<Categories> categoriesList = [
  Categories(id: 1, title: "All"),
  Categories(id: 1, title: "Phone"),
  Categories(id: 1, title: "Laptop"),
  Categories(id: 1, title: "Desktop"),
  Categories(id: 1, title: "Battery"),
  Categories(id: 1, title: "Cables"),
  Categories(id: 1, title: "Accessories"),
];
