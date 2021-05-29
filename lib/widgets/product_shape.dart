import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/constant.dart';

class ProductShape extends StatelessWidget {
  final Product product;
  final Function onTap;
  const ProductShape({this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool fav = product.id % 2 == 0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [Constant.boxShadow],
                  image: DecorationImage(
                    image: NetworkImage("${product.image}"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      title: Text(
                        "${product.model}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          fav ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                          color: fav ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      trailing: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          CupertinoIcons.cart_fill,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
