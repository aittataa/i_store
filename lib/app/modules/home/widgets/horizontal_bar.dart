import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/modules/home/widgets/horizontal_shape.dart';
import 'package:i_store/app/modules/home/widgets/title_bar.dart';

class HorizontalBar extends GetView<HomeController> {
  final HomeController controller;
  final List<Product> myList;
  const HorizontalBar({
    Key? key,
    required this.controller,
    required this.myList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: TitleBar(label: AppMessage.brandNew),
          subtitle: SizedBox(
            height: 200,
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: myList.length,
              itemBuilder: (context, i) {
                final Product product = myList[i];
                final int id = product.id;
                product.status = controller.getFavorite(id) ?? false;
                return HorizontalShape(
                  controller: controller,
                  product: product,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
