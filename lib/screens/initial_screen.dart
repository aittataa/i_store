import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:i_store/api_service/api_controller.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/screens/shopping_screen.dart';
import 'package:i_store/widgets/contain_body.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final ApiController controller = Get.put(ApiController());
  List<Product> myList = [];
  @override
  void initState() {
    super.initState();
    myList = controller.productsList;
  }

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
          onPressed: () {},
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingScreen(),
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: ContainBody(),
    );
  }
}
