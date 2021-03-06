import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/themes/app_theme.dart';

class TitleBar extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const TitleBar({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      minVerticalPadding: 1,
      minLeadingWidth: 0,
      leading: Container(
        width: 10,
        height: 50,
        decoration: BoxDecoration(
          color: AppTheme.blackBackColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: AutoSizeText(
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
      trailing: GestureDetector(
        onTap: onTap,
        child: Container(
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
      ),
    );
  }
}
