import 'package:flutter/material.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/shopping/controllers/shopping_controller.dart';
import 'package:i_store/app/modules/shopping/widgets/balance_shape.dart';
import 'package:i_store/app/modules/shopping/widgets/cart_shape.dart';
import 'package:i_store/app/shared/empty_box.dart';

class ShoppingBody extends StatelessWidget {
  final ShoppingController controller;
  final List<Product> myList;

  const ShoppingBody({
    Key? key,
    required this.controller,
    required this.myList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        if (myList.isNotEmpty) {
          final double total = myList.toList().fold(0, (a, b) => a + (b.price * b.quantity));
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: myList.length,
                  itemBuilder: (context, i) {
                    final Product product = myList[i];
                    product.quantity = controller.getShopping(product.id) ?? 0;
                    return CartShape(
                      controller: controller,
                      product: product,
                    );
                  },
                ),
              ),
              BalanceShape(controller: controller, total: total),
            ],
          );
        } else {
          return EmptyBox();
        }
      },
    );
  }
}
