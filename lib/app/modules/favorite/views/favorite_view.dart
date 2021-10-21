import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/functions/app_function.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:i_store/app/modules/favorite/widgets/favorite_shape.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/back_icon.dart';
import 'package:i_store/app/shared/bounce_point.dart';
import 'package:i_store/app/shared/empty_box.dart';

class FavoriteView extends GetView<FavoriteController> {
  final FavoriteController controller = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        title: Text(AppMessage.favTitle),
        actions: [
          IconButton(
            onPressed: () => Get.offNamed(Routes.SHOPPING),
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
            icon: Icon(CupertinoIcons.cart_fill),
          ),
        ],
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        final List<Product> myList = controller.productsList.where((product) {
          final int id = product.id;
          product.status = controller.getFavorite(id) ?? false;
          return product.status == true;
        }).toList();
        final bool isEmpty = myList.isEmpty;
        if (state) {
          return BouncePoint(size: 30);
        } else if (isEmpty) {
          return EmptyBox();
        } else {
          return StatefulBuilder(
            builder: (context, setState) {
              return GridView.builder(
                padding: EdgeInsets.all(10),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: AppFunction.gridDelegate(crossAxisCount: 2, childAspectRatio: .75),
                itemCount: myList.length,
                itemBuilder: (context, i) {
                  final Product product = myList[i];
                  // final int id = product.id;
                  // product.status = controller.getFavorite(id) ?? false;
                  // if (product.status) {
                  return FavoriteShape(
                    controller: controller,
                    product: product,
                  );
                  // } else {
                  //   return SizedBox();
                  // }
                },
              );
            },
          );
        }
      }),
    );
  }
}
