import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/api_service/api_controller.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/widgets/horizontal_shape.dart';
import 'package:i_store/widgets/slider_bar.dart';
import 'package:i_store/widgets/vertical_shape.dart';

class ContainBody extends StatefulWidget {
  @override
  _ContainBodyState createState() => _ContainBodyState();
}

class _ContainBodyState extends State<ContainBody> {
  final ApiController controller = Get.put(ApiController());
  @override
  void initState() {
    super.initState();
    Constant.selectedIndex = 0;
    Constant.pageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Product> myList = controller.productsList;
      return ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // Container(
          //   height: 25,
          //   margin: EdgeInsets.symmetric(vertical: 10),
          //   child: ListView.builder(
          //     padding: EdgeInsets.symmetric(horizontal: 5),
          //     physics: BouncingScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: myList.length,
          //     itemBuilder: (context, index) {
          //       String category = myList[index].manufacturer;
          //       return CategoryItem(
          //         category: category,
          //         state: Constant.selectedIndex == index,
          //         onTap: () {
          //           setState(() {
          //             Constant.selectedIndex = index;
          //           });
          //         },
          //       );
          //     },
          //   ),
          // ),
          SliderBar(
            myIndex: Constant.pageIndex,
            myList: myList..sort((a, b) => b.price.compareTo(a.price)),
            onPageChanged: (index) {
              setState(() => Constant.pageIndex = index);
            },
          ),
          HorizontalShape(myList: myList),
          VerticalShape(myList: myList),
        ],
      );
    });
  }
}
