import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/classes/product.dart';

class SliderShape extends StatelessWidget {
  const SliderShape({this.state, this.product});
  final bool state;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
      margin: EdgeInsets.fromLTRB(2, 1, 8, state ? 0 : 75),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage("${product.image}"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Text(
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
                CupertinoIcons.heart,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "${product.price.toStringAsFixed(2)} \$",
                softWrap: false,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
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
    );
  }
}
