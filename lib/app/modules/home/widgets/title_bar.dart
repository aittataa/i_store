import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/themes/app_theme.dart';

class TitleBar extends StatelessWidget {
  final String label;
  const TitleBar({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: AutoSizeText(
              "$label",
              minFontSize: 15,
              maxFontSize: 20,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppTheme.textBlackColor.withOpacity(.75),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.blackBackColor.withOpacity(.5),
            ),
            child: Icon(
              Icons.chevron_right,
              color: AppTheme.iconWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
