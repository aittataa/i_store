import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/routes/app_pages.dart';

class HeaderButton extends StatelessWidget {
  final IconData icon;
  const HeaderButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (icon == CupertinoIcons.cart_fill) {
          Get.toNamed(Routes.SHOPPING);
        } else if (icon == CupertinoIcons.heart_fill) {
          Get.toNamed(Routes.FAVORITE);
        }
      },
      padding: EdgeInsets.zero,
      splashColor: AppTheme.transparentColor,
      highlightColor: AppTheme.transparentColor,
      icon: Icon(icon),
    );
  }
}
