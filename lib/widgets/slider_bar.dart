import 'package:flutter/material.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/widgets/slider_shape.dart';

class SliderBar extends StatelessWidget {
  final int myIndex;
  final List<Product> myList;
  final Function onPageChanged;
  const SliderBar({this.myIndex, this.myList, this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: PageController(initialPage: myIndex, viewportFraction: 0.75),
        itemCount: myList.length,
        itemBuilder: (context, index) {
          bool state = myIndex == index;
          Product product = myList[index];
          return SliderShape(
            product: product,
            state: state,
          );
        },
      ),
    );
  }
}
