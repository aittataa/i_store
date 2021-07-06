import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/api_service/api_controller.dart';
import 'package:i_store/classes/product.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/widgets/horizontal_shape.dart';
import 'package:i_store/widgets/slider_bar.dart';
import 'package:i_store/widgets/spink_indicator.dart';
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
      final List<Product> myList = controller.productsList;
      final bool isNotEmpty = myList.isNotEmpty;
      if (isNotEmpty)
        return ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SliderBar(
              controller: controller,
              myIndex: Constant.pageIndex,
              myList: myList..sort((a, b) => b.price.compareTo(a.price)),
              onPageChanged: (index) {
                setState(() => Constant.pageIndex = index);
              },
            ),
            HorizontalShape(
              controller: controller,
              myList: myList,
            ),
            VerticalShape(
              controller: controller,
              myList: myList,
            ),
          ],
        );
      else
        return BouncePoint(size: 32);
    });
  }
}
