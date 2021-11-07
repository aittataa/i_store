import 'package:flutter/material.dart';
import 'package:i_store/app/config/themes/app_theme.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 5,
      thickness: 2.5,
      color: AppTheme.whiteBackColor,
      indent: 10,
      endIndent: 10,
    );
  }
}
