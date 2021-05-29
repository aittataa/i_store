import 'package:flutter/material.dart';
import 'package:i_store/api_service/api_controller.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/screens/details_screen.dart';
import 'package:i_store/widgets/product_shape.dart';
import 'package:i_store/widgets/split_title.dart';

class HorizontalShape extends StatelessWidget {
  final ApiController controller;
  final List<Product> myList;
  const HorizontalShape({this.controller, this.myList});
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
            itemCount: myList.length,
            itemBuilder: (context, index) {
              Product product = myList[index];
              return ProductShape(
                product: product,
                onTap: () async {
                  Product myProduct = await controller.getByID(product.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: myProduct,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
