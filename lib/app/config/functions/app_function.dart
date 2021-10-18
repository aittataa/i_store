import 'package:flutter/material.dart';

class AppFunction {
  AppFunction._();

  static gridDelegate({int crossAxisCount = 1, double spacing = 10, double childAspectRatio = 1}) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      childAspectRatio: childAspectRatio,
    );
  }
}
