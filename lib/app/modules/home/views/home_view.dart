import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/shared/bounce_point.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppMessage.appTitle),
        centerTitle: true,
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        final List<Product> myList = controller.productsList.value.toList();
        final bool isNotEmpty = myList.isNotEmpty;
        if (state) {
          return SizedBox(child: BouncePoint(size: 30));
        } else if (isNotEmpty) {
          return Center(
            child: Icon(
              CupertinoIcons.creditcard_fill,
              size: 65,
              color: AppTheme.iconBlackColor.withOpacity(.5),
            ),
          );
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
