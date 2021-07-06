import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/screens/products_screen.dart';
import 'package:i_store/screens/shopping_screen.dart';
import 'package:i_store/widgets/contain_body.dart';

class InitialScreen extends StatelessWidget {
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
          onPressed: null,
          icon: Icon(
            CupertinoIcons.list_bullet_indent,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
        title: Text(
          Messages.APP_TITLE,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => ShoppingScreen()),
            icon: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.black54,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => ProductsScreen(title: "WishList")),
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: ContainBody(),
    );
  }
}
