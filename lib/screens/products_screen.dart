import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/api_service/api_controller.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/widgets/product_item.dart';
import 'package:i_store/widgets/spink_indicator.dart';

class ProductsScreen extends StatelessWidget {
  final ApiController controller = Get.put(ApiController());
  final String title;
  ProductsScreen({this.title});
  static bool _isFav;

  @override
  Widget build(BuildContext context) {
    _isFav = title.contains("WishList");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
        title: Text(
          "$title",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.black54,
            ),
          ),
          if (!_isFav)
            IconButton(
              onPressed: () async {},
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.black54,
              ),
            ),
        ],
      ),
      body: Obx(() {
        final List<Product> myList = controller.productsList;
        final bool isNotEmpty = myList.isNotEmpty;
        if (isNotEmpty)
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            gridDelegate: Constant.gridDelegate(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: myList.length,
            itemBuilder: (context, index) {
              Product product = myList[index];
              return ProductItem(product: product, state: _isFav);
            },
          );
        else
          return BouncePoint();
      }),
    );
  }
}
