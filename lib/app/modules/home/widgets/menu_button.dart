import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';

class MenuButton extends StatelessWidget {
  final HomeController controller;
  const MenuButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        print(await controller.clearFavorite);
        print(await controller.clearShopping);
      },
      padding: EdgeInsets.zero,
      splashColor: AppTheme.transparentColor,
      highlightColor: AppTheme.transparentColor,
      icon: Icon(CupertinoIcons.list_bullet_indent),
    );
  }
}
