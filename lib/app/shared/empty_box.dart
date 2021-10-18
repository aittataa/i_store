import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/themes/app_theme.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        CupertinoIcons.creditcard_fill,
        color: AppTheme.iconBlackColor.withOpacity(.5),
        size: 65,
      ),
    );
  }
}
