import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';
import 'package:i_store/app/modules/shopping/widgets/cart_shape.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/back_icon.dart';
import 'package:i_store/app/shared/bounce_point.dart';
import 'package:i_store/app/shared/empty_box.dart';
import 'package:i_store/app/shared/header_button.dart';

class ShoppingView extends StatelessWidget {
  final ShoppingController controller = Get.put(ShoppingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        title: Text(AppMessage.shopTitle),
        actions: [
          HeaderButton(
            onPressed: () => Get.offNamed(Routes.FAVORITE),
            icon: CupertinoIcons.heart_fill,
          ),
        ],
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        final List<Product> myList = controller.productsList.where((product) {
          product.quantity = controller.getShopping(product.id) ?? 0;
          return product.quantity > 0;
        }).toList();
        final bool isEmpty = myList.isEmpty;
        if (state) {
          return BouncePoint(size: 32);
        } else if (isEmpty) {
          return EmptyBox();
        } else {
          final double total = myList.toList().fold(0, (a, b) => a + (b.price * b.quantity));
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: myList.length,
                      itemBuilder: (context, i) {
                        final Product product = myList[i];
                        product.quantity = controller.getShopping(product.id) ?? 0;
                        return CartShape(
                          controller: controller,
                          product: product,
                          count: 10,
                        );
                      },
                    ),
                  ),
                  BalanceShape(controller: controller, total: total),
                ],
              );
            },
          );
        }
      }),
    );
  }
}

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
