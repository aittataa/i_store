import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/functions/app_function.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/modules/home/widgets/title_bar.dart';
import 'package:i_store/app/modules/home/widgets/vertical_shape.dart';
import 'package:i_store/app/modules/product/views/product_view.dart';

class VerticalBar extends StatelessWidget {
  final HomeController controller;
  final List<Product> myList;
  const VerticalBar({
    Key? key,
    required this.controller,
    required this.myList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isNotEmpty = myList.isNotEmpty;
    if (isNotEmpty) {
      return StatefulBuilder(
        builder: (context, setState) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 1,
            title: TitleBar(
              label: AppMessage.bestSelling,
              onTap: () => {Get.to(() => ProductView(title: AppMessage.bestSelling, myList: myList))},
            ),
            subtitle: SizedBox(
              height: 300,
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                gridDelegate: AppFunction.gridDelegate(childAspectRatio: 1.5),
                itemCount: myList.length,
                itemBuilder: (context, i) {
                  final Product product = myList[i];
                  product.status = controller.getFavorite(product.id) ?? false;
                  return VerticalShape(
                    controller: controller,
                    product: product,
                  );
                },
              ),
            ),
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
