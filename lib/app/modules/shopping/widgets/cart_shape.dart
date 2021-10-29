import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';

class CartShape extends GetView<ShoppingController> {
  final ShoppingController controller;
  final Product product;
  final int count;
  CartShape({
    Key? key,
    required this.controller,
    required this.product,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        if (product.id % 2 == 0)
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppTheme.whiteBackColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [AppConstant.boxShadow],
            ),
            child: ExpansionTile(
              iconColor: AppTheme.iconBlackColor.withOpacity(.75),
              initiallyExpanded: false,
              tilePadding: EdgeInsets.zero,
              childrenPadding: EdgeInsets.zero,
              leading: Container(
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.blackShadowColor, width: .25),
                  image: DecorationImage(image: CachedNetworkImageProvider(product.image)),
                ),
              ),
              title: Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      "${product.model}",
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
                  AutoSizeText(
                    "${AppMessage.appCurrency}${product.price.toStringAsFixed(0)}",
                    minFontSize: 15,
                    maxFontSize: 20,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppTheme.textBlackColor.withOpacity(.75),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              subtitle: AutoSizeText(
                "${product.quantity} Items",
                minFontSize: 10,
                maxFontSize: 20,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTheme.textBlackColor.withOpacity(.75),
                  fontWeight: FontWeight.w900,
                ),
              ),
              // children: [
              //   ListTile(),
              // ],
            ),
          );
        else
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppTheme.whiteBackColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [AppConstant.boxShadow],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.blackShadowColor, width: .25),
                  image: DecorationImage(image: CachedNetworkImageProvider(product.image)),
                ),
              ),
              title: Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      "${product.model}",
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
                  AutoSizeText(
                    "${AppMessage.appCurrency}${product.price.toStringAsFixed(0)}",
                    minFontSize: 15,
                    maxFontSize: 20,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppTheme.textBlackColor.withOpacity(.75),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              subtitle: AutoSizeText(
                "${product.quantity} Items",
                minFontSize: 10,
                maxFontSize: 20,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTheme.textBlackColor.withOpacity(.75),
                  fontWeight: FontWeight.w900,
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  color: AppTheme.blackBackColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  splashColor: AppTheme.transparentColor,
                  highlightColor: AppTheme.transparentColor,
                  icon: Icon(
                    CupertinoIcons.delete_solid,
                    color: AppTheme.iconWhiteColor,
                  ),
                ),
              ),
            ),
          );
      },
    );
  }
}
