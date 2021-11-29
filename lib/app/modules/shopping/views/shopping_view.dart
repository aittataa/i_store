import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/responses/app_response.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';
import 'package:i_store/app/modules/shopping/widgets/shopping_body.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/back_icon.dart';
import 'package:i_store/app/shared/bounce_point.dart';
import 'package:i_store/app/shared/empty_box.dart';
import 'package:i_store/app/shared/header_button.dart';
import 'package:i_store/app/shared/response_error.dart';

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
        if (!state) {
          final AppResponse appResponse = controller.appResponse.value;
          if (appResponse.success) {
            final List<Product> myList = controller.productsList;
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              return ShoppingBody(
                controller: controller,
                myList: myList.where((product) {
                  product.quantity = controller.getShopping(product.id) ?? 0;
                  return product.quantity > 0;
                }).toList(),
              );
            } else {
              return EmptyBox();
            }
          } else {
            return ResponseError(response: appResponse);
          }
        } else {
          return BouncePoint();
        }
      }),
    );
  }
}
