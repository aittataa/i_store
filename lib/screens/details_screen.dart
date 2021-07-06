import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/screens/shopping_screen.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({this.product});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  get decreaseData {
    if (quantity > 1) {
      quantity--;
    }
  }

  get increaseData {
    quantity++;
  }

  @override
  void initState() {
    super.initState();
    product = widget.product;
    fav = product.id % 2 == 0;
  }

  Product product;
  bool fav;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
        title: Text(
          "${widget.product.model}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black12, width: 1.5),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${widget.product.image}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Body : ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${product.specs.body}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Display : ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${product.specs.display}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Memory : ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${product.specs.memory}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Camera : ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Main : ${product.specs.camera.main}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Selfie : ${product.specs.camera.selfie}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Features : ${product.specs.camera.features}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Chipset : ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${product.specs.chipset}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Operation System : ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${product.specs.platform}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Battery : ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${product.specs.battery}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Features : ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${product.specs.features}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "About Phone : ",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${product.description}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListTile(
          tileColor: Colors.black.withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: mainColor, width: 1),
            ),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                fav ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                color: fav ? Colors.red : Colors.white,
              ),
            ),
          ),
          title: Container(
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: mainColor, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => setState(() => decreaseData),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    CupertinoIcons.minus,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  quantity < 10 ? "0$quantity" : "$quantity",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => increaseData),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    CupertinoIcons.plus,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: mainColor, width: 1),
            ),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                CupertinoIcons.cart_fill,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
