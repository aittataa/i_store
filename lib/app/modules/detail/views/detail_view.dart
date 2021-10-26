import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/detail/controllers/detail_controller.dart';
import 'package:i_store/app/modules/detail/widgets/detail_shape.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/back_icon.dart';

class DetailView extends GetView<DetailController> {
  final DetailController controller = Get.put(DetailController());
  final List<Product>? myList;
  final Product? product;
  DetailView({
    this.myList,
    this.product,
  });

  late int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        title: Text(myList![index].model),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.SHOPPING),
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
            icon: Icon(CupertinoIcons.cart_fill),
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.FAVORITE),
            padding: EdgeInsets.zero,
            splashColor: AppTheme.transparentColor,
            highlightColor: AppTheme.transparentColor,
            icon: Icon(CupertinoIcons.heart_fill),
          ),
        ],
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          return PageView.builder(
            onPageChanged: (i) {
              setState(() {
                index = i;
                print(myList![index].model);
              });
            },
            controller: PageController(initialPage: myList!.indexOf(product!)),
            physics: BouncingScrollPhysics(),
            itemCount: myList!.length,
            itemBuilder: (context, i) {
              final Product product = myList![i];
              return DetailShape(controller: controller, product: product);
            },
          );
        },
      ),
    );
  }
}
