import 'package:flutter/material.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/widgets/product_shape.dart';
import 'package:i_store/widgets/split_title.dart';

class HorizontalShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: SplitTitle(title: Messages.TITLE_BEST_SELLING),
        subtitle: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: Constant.itemCount,
            itemBuilder: (context, index) {
              return ProductShape();
            },
          ),
        ),
      ),
    );
  }
}
