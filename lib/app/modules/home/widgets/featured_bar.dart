import 'package:flutter/material.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/modules/home/widgets/featured_shape.dart';

class FeaturedBar extends StatelessWidget {
  final HomeController controller;
  final int index;
  final List<Product> myList;
  final Function(int)? onPageChanged;
  FeaturedBar({
    Key? key,
    required this.controller,
    required this.index,
    required this.myList,
    this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isNotEmpty = myList.isNotEmpty;
    if (isNotEmpty) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            height: 400,
            child: PageView.builder(
              onPageChanged: onPageChanged,
              padEnds: false,
              physics: BouncingScrollPhysics(),
              controller: PageController(
                initialPage: index,
                viewportFraction: .64,
              ),
              itemCount: myList.length,
              itemBuilder: (context, i) {
                final Product product = myList[i];
                final bool state = index == i;
                var status = controller.getFavorite(product.id) ?? false;
                product.status = status;
                return FeaturedShape(
                  controller: controller,
                  product: product,
                  state: state,
                );
              },
            ),
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
