import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/routes/app_pages.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  final String? title;
  final List<Product>? myList;
  ProductView({this.title, this.myList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          padding: EdgeInsets.zero,
          splashColor: AppTheme.transparentColor,
          highlightColor: AppTheme.transparentColor,
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text("$title", style: TextStyle(fontSize: 25)),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.SHOPPING),
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
            icon: Icon(CupertinoIcons.cart_fill),
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.FAVORITE),
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
            icon: Icon(CupertinoIcons.heart_fill),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "${myList!.length}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
