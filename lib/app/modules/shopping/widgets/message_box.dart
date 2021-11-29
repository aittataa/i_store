import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';

class MessageBox extends StatelessWidget {
  final ShoppingController controller;
  const MessageBox({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: AppTheme.whiteBackColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppTheme.blackBackColor, width: .75),
        ),
        child: Icon(CupertinoIcons.checkmark_alt),
      ),
      content: ListTile(
        title: Container(
          padding: const EdgeInsets.all(5),
          child: Text(
            "Order Successful",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.textBlackColor.withOpacity(.75),
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ),
        subtitle: Container(
          padding: const EdgeInsets.all(5),
          child: Text(
            "Thank you for your order.",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.textBlackColor.withOpacity(.75),
              fontWeight: FontWeight.w900,
              fontSize: 15,
            ),
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.blackBackColor, width: .5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  onPressed: () async {
                    var data = await controller.clearShopping;
                    print(data);
                    Get.back();
                  },
                  icon: AutoSizeText(
                    "Confirm",
                    minFontSize: 10,
                    maxFontSize: 20,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppTheme.textBlackColor.withOpacity(.75),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
