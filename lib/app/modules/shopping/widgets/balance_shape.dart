import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';
import 'package:i_store/app/modules/shopping/widgets/message_box.dart';
import 'package:i_store/app/shared/header_button.dart';

class BalanceShape extends StatelessWidget {
  final ShoppingController controller;
  final double total;
  const BalanceShape({Key? key, required this.controller, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 10),
        title: Row(
          children: [
            AutoSizeText(
              "Total Balance : ",
              minFontSize: 15,
              maxFontSize: 20,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppTheme.textBlackColor.withOpacity(.75),
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: AutoSizeText(
                "${total.toStringAsFixed(2)} ${AppMessage.appCurrency}",
                minFontSize: 15,
                maxFontSize: 20,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textBlackColor.withOpacity(.75),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        trailing: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppTheme.backColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: HeaderButton(
            onPressed: () => showCupertinoModalPopup(
              barrierColor: AppTheme.blackBackColor.withOpacity(.25),
              context: context,
              builder: (context) => MessageBox(controller: controller),
            ),
            icon: CupertinoIcons.checkmark_alt,
          ),
        ),
      ),
    );
  }
}
