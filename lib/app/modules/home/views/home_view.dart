import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/modules/home/widgets/featured_bar.dart';
import 'package:i_store/app/shared/bounce_point.dart';
import 'package:i_store/app/shared/empty_box.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());
  late int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppMessage.appTitle)),
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
                children: [
                  FeaturedBar(
                    index: pageIndex,
                    controller: controller,
                    myList: myList,
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
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
