import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/modules/home/widgets/featured_shape.dart';

class FeaturedBar extends GetView<HomeController> {
  final HomeController controller;
  final List<Product> myList;
  FeaturedBar({Key? key, required this.controller, required this.myList}) : super(key: key);

  late int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: PageView.builder(
        onPageChanged: (index) {},
        padEnds: false,
        controller: PageController(viewportFraction: .75),
        itemCount: myList.length,
        itemBuilder: (context, i) {
          final Product product = myList[i];
          return FeaturedShape(product: product);
        },
      ),
    );
  }
}
