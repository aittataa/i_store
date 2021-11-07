import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/themes/app_theme.dart';

class SpecsShape extends StatelessWidget {
  final String label;
  final String value;
  const SpecsShape({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      minVerticalPadding: 0,
      title: AutoSizeText(
        "$label : ",
        minFontSize: 15,
        maxFontSize: 20,
        style: TextStyle(
          color: AppTheme.textBlackColor.withOpacity(.64),
          fontWeight: FontWeight.w900,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(5),
        child: AutoSizeText(
          "$value",
          minFontSize: 15,
          maxFontSize: 20,
          style: TextStyle(
            color: AppTheme.textBlackColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
