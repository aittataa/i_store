import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';
import 'package:i_store/app/routes/app_pages.dart';

class ShoppingView extends GetView<ShoppingController> {
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
        title: Text(AppMessage.shopTitle),
        actions: [
          IconButton(
            onPressed: () => Get.offNamed(Routes.FAVORITE),
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
            icon: Icon(CupertinoIcons.heart_fill),
          ),
        ],
      ),
    );
  }
}
