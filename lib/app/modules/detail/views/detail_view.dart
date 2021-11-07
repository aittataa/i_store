import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/detail/controllers/detail_controller.dart';
import 'package:i_store/app/modules/detail/widgets/detail_shape.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/back_icon.dart';
import 'package:i_store/app/shared/bounce_point.dart';
import 'package:i_store/app/shared/header_button.dart';

class DetailView extends StatefulWidget {
  final Product? product;
  DetailView({this.product});
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final DetailController controller = Get.put(DetailController());
  late Product product;
  get getProduct async => {product = await controller.findByID(widget.product!.id)};

  late int item = 1;

  get increaseItem {
    setState(() => {item++});
  }

  get decreaseItem {
    setState(() => {if (item > 1) item--});
  }

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
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10).copyWith(top: 2.5),
        decoration: BoxDecoration(
          color: AppTheme.blackBackColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.whiteBorderColor, width: 1.5),
            ),
            child: IconButton(
              onPressed: () async {
                setState(() => {product.updateStatus});
                var data = await controller.setFavorite(product);
                print(data);
              },
              padding: EdgeInsets.zero,
              splashColor: AppTheme.transparentColor,
              highlightColor: AppTheme.transparentColor,
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: product.status ? AppTheme.iconRedColor : AppTheme.iconWhiteColor,
              ),
            ),
          ),
          title: Container(
            decoration: BoxDecoration(
              color: AppTheme.whiteBackColor,
              border: Border.all(color: AppTheme.whiteBorderColor, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () => decreaseItem,
                    icon: Icon(CupertinoIcons.minus),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    item < 10 ? "0$item" : "$item",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.textBlackColor.withOpacity(.75),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () => increaseItem,
                    icon: Icon(CupertinoIcons.plus),
                  ),
                ),
              ],
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.whiteBorderColor, width: 1.5),
            ),
            child: IconButton(
              onPressed: () async {
                var data = await controller.setShopping(product, 0);
                print(data);
              },
              padding: EdgeInsets.zero,
              splashColor: AppTheme.transparentColor,
              highlightColor: AppTheme.transparentColor,
              icon: Icon(
                CupertinoIcons.cart_fill,
                color: AppTheme.iconWhiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
