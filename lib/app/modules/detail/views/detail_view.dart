import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/detail/controllers/detail_controller.dart';
import 'package:i_store/app/modules/detail/widgets/detail_shape.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/back_icon.dart';
import 'package:i_store/app/shared/header_button.dart';

class DetailView extends GetView<DetailController> {
  final DetailController controller = Get.put(DetailController());
  final Product? product;
  DetailView({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        title: Text(product!.model),
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
      body: DetailShape(controller: controller, product: product!),
    );
  }
}
