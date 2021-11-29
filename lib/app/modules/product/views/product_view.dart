import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/functions/app_function.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/product/controllers/product_controller.dart';
import 'package:i_store/app/modules/product/widgets/product_shape.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/back_icon.dart';
import 'package:i_store/app/shared/header_button.dart';

class ProductView extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  final String? title;
  final List<Product>? myList;
  ProductView({this.title, this.myList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        title: Text("$title"),
        actions: [
          HeaderButton(
            onPressed: () => Get.toNamed(Routes.SHOPPING),
            icon: CupertinoIcons.cart_fill,
          ),
          HeaderButton(
            onPressed: () => Get.toNamed(Routes.FAVORITE),
            icon: CupertinoIcons.heart_fill,
          ),
        ],
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: AppFunction.gridDelegate(
              crossAxisCount: 2,
              childAspectRatio: .75,
            ),
            itemCount: myList!.length,
            itemBuilder: (context, i) {
              final Product product = myList![i];
              final int id = product.id;
              product.status = controller.getFavorite(id) ?? false;
              return ProductShape(
                controller: controller,
                product: product,
              );
            },
          );
        },
      ),
    );
  }
}
