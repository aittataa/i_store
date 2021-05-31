import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/api_service/api_controller.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/widgets/shopping_shape.dart';
import 'package:i_store/widgets/spink_indicator.dart';

class ShoppingScreen extends StatelessWidget {
  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
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
          "My Cart",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
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
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            itemCount: myList.length,
            itemBuilder: (context, index) {
              Product product = myList[index];
              return ShoppingShape(product: product);
            },
          );
        else
          return SpinkIndicator(size: 32);
      }),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black54,
          boxShadow: [Constant.boxShadow],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ListTile(
          title: Text(
            "Total Balance",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Obx(() {
            final List<Product> myList = controller.productsList;
            final double balance = myList.fold(0, (a, b) => a + b.price).toDouble();
            final bool isNotEmpty = balance.isGreaterThan(0);
            return Text(
              isNotEmpty ? "\$${balance.toStringAsFixed(2)}" : "\$0.00",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            );
          }),
        ),
      ),
    );
  }
}
