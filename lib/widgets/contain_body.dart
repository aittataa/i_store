import 'package:flutter/material.dart';
import 'package:i_store/classes/categories.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/widgets/category_item.dart';
import 'package:i_store/widgets/horizontal_shape.dart';
import 'package:i_store/widgets/slider_bar.dart';
import 'package:i_store/widgets/vertical_shape.dart';

class ContainBody extends StatefulWidget {
  @override
  _ContainBodyState createState() => _ContainBodyState();
}

class _ContainBodyState extends State<ContainBody> {
  @override
  void initState() {
    super.initState();
    Constant.selectedIndex = 0;
    Constant.pageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
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
                state: Constant.selectedIndex == index,
                onTap: () {
                  setState(() {
                    Constant.selectedIndex = index;
                  });
                },
              );
            },
          ),
        ),
        SliderBar(
          myIndex: Constant.pageIndex,
          onPageChanged: (index) {
            setState(() => Constant.pageIndex = index);
          },
        ),
        HorizontalShape(),
        VerticalShape(),
      ],
    );
  }
}
