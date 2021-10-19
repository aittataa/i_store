import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/modules/home/widgets/featured_bar.dart';
import 'package:i_store/app/modules/home/widgets/horizontal_bar.dart';
import 'package:i_store/app/modules/home/widgets/vertical_bar.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/bounce_point.dart';
import 'package:i_store/app/shared/empty_box.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());
  late int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {controller.clearFavorite},
          padding: EdgeInsets.zero,
          splashColor: AppTheme.transparentColor,
          highlightColor: AppTheme.transparentColor,
          icon: Icon(CupertinoIcons.list_bullet_indent),
        ),
        title: Text(AppMessage.appTitle, style: TextStyle(fontSize: 25)),
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
      body: Obx(() {
        final bool state = controller.state.value;
        final List<Product> myList = controller.productsList;
        final bool isEmpty = myList.isEmpty;
        if (state) {
          return BouncePoint(size: 30);
        } else if (isEmpty) {
          return EmptyBox();
        } else {
          return StatefulBuilder(
            builder: (context, setState) {
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  FeaturedBar(
                    index: pageIndex,
                    controller: controller,
                    myList: myList.toList()..sort((a, b) => b.price.compareTo(a.price)),
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                  ),
                  HorizontalBar(
                    controller: controller,
                    myList: myList.toList()..sort((a, b) => a.price.compareTo(b.price)),
                  ),
                  VerticalBar(
                    controller: controller,
                    myList: myList.toList()..sort((a, b) => a.model.compareTo(b.model)),
                  ),
                ],
              );
            },
          );
        }
      }),
    );
  }
}
