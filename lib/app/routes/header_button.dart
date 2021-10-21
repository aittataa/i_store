import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/themes/app_theme.dart';

class HeaderButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  const HeaderButton({Key? key, required this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      splashColor: AppTheme.transparentColor,
      highlightColor: AppTheme.transparentColor,
      icon: Icon(icon),
    );
  }
}
