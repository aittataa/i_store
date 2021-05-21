import 'package:flutter/material.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/widgets/product_item.dart';
import 'package:i_store/widgets/split_title.dart';

class VerticalShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: SplitTitle(title: Messages.TITLE_POPULAR),
        subtitle: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            gridDelegate: Constant.gridDelegate(
              crossAxisCount: 1,
              childAspectRatio: 1.5,
            ),
            itemCount: Constant.itemCount,
            itemBuilder: (context, index) {
              return ProductItem();
            },
          ),
        ),
      ),
    );
  }
}
