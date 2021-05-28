import 'package:flutter/material.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/constant.dart';

class ShoppingShape extends StatelessWidget {
  final Product product;
  const ShoppingShape({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [Constant.boxShadow],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero.copyWith(right: 10),
        leading: Container(
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("${product.image}"),
            ),
          ),
        ),
        title: Text(
          "${product.model}",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          "\$${product.price.toStringAsFixed(2)}",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
