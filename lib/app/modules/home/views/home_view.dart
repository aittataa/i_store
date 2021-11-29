import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/responses/app_response.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/modules/home/widgets/featured_bar.dart';
import 'package:i_store/app/modules/home/widgets/horizontal_bar.dart';
import 'package:i_store/app/modules/home/widgets/menu_button.dart';
import 'package:i_store/app/modules/home/widgets/vertical_bar.dart';
import 'package:i_store/app/routes/app_pages.dart';
import 'package:i_store/app/shared/bounce_point.dart';
import 'package:i_store/app/shared/empty_box.dart';
import 'package:i_store/app/shared/header_button.dart';
import 'package:i_store/app/shared/response_error.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  late int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuButton(controller: controller),
        title: Text(AppMessage.appTitle, style: TextStyle(fontSize: 25)),
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
        if (!state) {
          final AppResponse appResponse = controller.appResponse.value;
          if (appResponse.success) {
            final List<Product> myList = controller.productsList;
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
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
