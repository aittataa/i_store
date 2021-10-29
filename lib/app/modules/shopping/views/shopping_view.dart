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

class ShoppingView extends GetView<ShoppingController> {
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
                  BalanceShape(total: total),
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
  final double total;
  const BalanceShape({Key? key, required this.total}) : super(key: key);

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
              builder: (context) => MessageBox(),
            ),
            icon: CupertinoIcons.checkmark_alt,
          ),
        ),
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.all(10),
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      backgroundColor: AppTheme.backColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          AppMessage.appTitle,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textBlackColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "Verify You Order",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textBlackColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
            fontSize: 15,
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
                child: Container(
              child: IconButton(onPressed: () {}, icon: Text("")),
            ))
          ],
        ),
      ],
    );
  }
}

/*
snackBar({required String title, required String message}) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: Colors.red,
    titleText: Text(title, style: TextStyle(fontWeight: FontWeight.w900)),
    messageText: Text(message, style: TextStyle(fontWeight: FontWeight.bold)),
    icon: Icon(Icons.error, color: Colors.red.shade900, size: 36),
    margin: EdgeInsets.all(10),
    snackStyle: SnackStyle.FLOATING,
  );
}

isWillPop(context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      insetAnimationDuration: Duration(milliseconds: 1500),
      insetAnimationCurve: Curves.linearToEaseOut,
      title: Text(
        "iStore",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900, fontSize: 20),
      ),
      content: Text(
        "Are You Sure You Want To Exit ?",
        style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("No"),
          textStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        CupertinoDialogAction(
          child: Text("Yes"),
          textStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}
 */
