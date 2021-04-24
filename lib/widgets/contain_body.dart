import 'package:flutter/material.dart';
import 'package:i_store/classes/categories.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/widgets/category_item.dart';
import 'package:i_store/widgets/product_item.dart';
import 'package:i_store/widgets/product_shape.dart';
import 'package:i_store/widgets/slider_shape.dart';
import 'package:i_store/widgets/split_title.dart';

class ContainBody extends StatefulWidget {
  @override
  _ContainBodyState createState() => _ContainBodyState();
}

class _ContainBodyState extends State<ContainBody> {
  int selectedIndex;
  int pageIndex;
  int itemCount;
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    pageIndex = 0;
    itemCount = 25;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            height: 25,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                Categories category = categoriesList[index];
                return CategoryItem(
                  category: category,
                  state: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() => pageIndex = index);
              },
              controller: PageController(initialPage: pageIndex, viewportFraction: 0.75),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                bool state = pageIndex == index;
                return SliderShape(state: state);
              },
            ),
          ),
          SizedBox(
            child: SplitTitle(title: "Best Selling"),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return ProductShape();
              },
            ),
          ),
          SizedBox(
            child: SplitTitle(title: "Popular"),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return ProductItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
