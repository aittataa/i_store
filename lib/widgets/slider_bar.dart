import 'package:flutter/material.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/widgets/slider_shape.dart';

class SliderBar extends StatelessWidget {
  final int myIndex;
  final Function onPageChanged;
  const SliderBar({this.myIndex, this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: PageController(initialPage: myIndex, viewportFraction: 0.75),
        itemCount: Constant.itemCount,
        itemBuilder: (context, index) {
          bool state = myIndex == index;
          return SliderShape(state: state);
        },
      ),
    );
  }
}
