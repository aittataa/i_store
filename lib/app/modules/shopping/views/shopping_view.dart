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

  late double total = 0.0;
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
          final int id = controller.getShopping(product.id);
          return product.id == id;
        }).toList();
        final bool isEmpty = myList.isEmpty;
        if (state) {
          return BouncePoint(size: 32);
        } else if (isEmpty) {
          return EmptyBox();
        } else {
          total = myList.toList().fold(0, (a, b) => a + b.price);
          return StatefulBuilder(
            builder: (context, setState) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: myList.length,
                itemBuilder: (context, i) {
                  final Product product = myList[i];
                  return CartShape(
                    controller: controller,
                    product: product,
                  );
                },
              );
            },
          );
        }
      }),
      bottomNavigationBar: Obx(() {
        final bool state = controller.state.value;
        if (state) {
          return SizedBox();
        } else {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  onPressed: () {},
                  icon: CupertinoIcons.chevron_right_2,
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
