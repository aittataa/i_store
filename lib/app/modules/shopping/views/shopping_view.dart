import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';
import 'package:i_store/app/modules/shopping/widgets/cart_shape.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/routes/header_button.dart';
import 'package:i_store/app/shared/back_icon.dart';
import 'package:i_store/app/shared/bounce_point.dart';
import 'package:i_store/app/shared/empty_box.dart';

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
          final int id = controller.getShopping(product.id) ?? 0;
          return product.id == id;
        }).toList();
        final bool isEmpty = myList.isEmpty;
        if (state) {
          return BouncePoint(size: 30);
        } else if (isEmpty) {
          return EmptyBox();
        } else {
          return StatefulBuilder(
            builder: (context, setState) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                //gridDelegate: AppFunction.gridDelegate(crossAxisCount: 2, childAspectRatio: .75),
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
    );
  }
}
