import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TitleBar(label: "Brand New"),
      subtitle: SizedBox(
        height: 200,
        child: PageView.builder(
          //padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          //gridDelegate: AppFunction.gridDelegate(childAspectRatio: 1.5),
          itemCount: myList.length,
          itemBuilder: (context, i) {
            final Product product = myList[i];
            return HorizontalShape(product: product);
          },
        ),
      ),
    );
  }
}
