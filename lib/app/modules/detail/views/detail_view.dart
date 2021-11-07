import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/detail/controllers/detail_controller.dart';
import 'package:i_store/app/modules/detail/widgets/detail_shape.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/back_icon.dart';
import 'package:i_store/app/shared/bounce_point.dart';
import 'package:i_store/app/shared/header_button.dart';

class DetailView extends StatefulWidget {
  final Product? product;
  //final int? id;
  DetailView({this.product});
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final DetailController controller = Get.put(DetailController());
  late Product product;
  get getProduct async => {product = await controller.findByID(widget.product!.id)};

  @override
  void initState() {
    super.initState();
    getProduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackIcon(),
        title: Text(widget.product!.model),
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
      body: Obx(() {
        final bool state = controller.state.value;
        if (state) {
          return BouncePoint(size: 30);
        } else {
          return DetailShape(controller: controller, product: product);
        }
      }),
    );
  }
}
