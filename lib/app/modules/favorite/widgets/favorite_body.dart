import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/functions/app_function.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:i_store/app/modules/favorite/widgets/favorite_shape.dart';

class FavoriteBody extends StatelessWidget {
  final List<Product> myList;
  final FavoriteController controller;
  const FavoriteBody({
    Key? key,
    required this.controller,
    required this.myList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GridView.builder(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: AppFunction.gridDelegate(
            crossAxisCount: 2,
            childAspectRatio: .75,
          ),
          itemCount: myList.length,
          itemBuilder: (context, i) {
            final Product product = myList[i];
            return FavoriteShape(
              controller: controller,
              product: product,
            );
          },
        );
      },
    );
  }
}
