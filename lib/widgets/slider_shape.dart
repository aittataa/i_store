import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/classes/product.dart';

class SliderShape extends StatelessWidget {
  const SliderShape({this.state, this.product, this.onTap});
  final bool state;
  final Product product;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final bool fav = product.id % 2 == 0;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
        margin: EdgeInsets.only(left: 2, right: 8, top: 0, bottom: state ? 0 : 75),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage("${product.image}"),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                "${product.model}",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w900,
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
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "\$${product.price.toStringAsFixed(2)}",
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
      ),
    );
  }
}
