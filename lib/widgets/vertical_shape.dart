import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/api_service/api_controller.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/screens/details_screen.dart';
import 'package:i_store/widgets/product_item.dart';
import 'package:i_store/widgets/split_title.dart';

class VerticalShape extends StatelessWidget {
  final ApiController controller;
  final List<Product> myList;
  const VerticalShape({this.controller, this.myList});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: SplitTitle(title: Messages.TITLE_POPULAR),
      subtitle: SizedBox(
        height: Get.height * 0.4,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          gridDelegate: Constant.gridDelegate(
            crossAxisCount: 1,
            childAspectRatio: 1.5,
          ),
          itemCount: myList.length,
          itemBuilder: (context, index) {
            Product product = myList[index];
            return ProductItem(
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
    );
  }
}
