import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/detail/views/detail_view.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/shared/image_network.dart';

class HorizontalShape extends StatelessWidget {
  final HomeController controller;
  final Product product;
  const HorizontalShape({
    Key? key,
    required this.controller,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () async {
            Product value = await controller.findByID(product.id);
            Get.to(() => DetailView(product: value));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.whiteBackColor.withOpacity(.85),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [AppConstant.boxShadow],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: ImageNetwork(image: product.image)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          setState(() => {product.updateStatus});
                          var data = await controller.setFavorite(product);
                          print(data);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.blackBackColor.withOpacity(.5),
                            ),
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              color: product.status ? AppTheme.iconRedColor : AppTheme.iconWhiteColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: AutoSizeText(
                          "${product.model}",
                          minFontSize: 15,
                          maxFontSize: 20,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.textBlackColor.withOpacity(.75),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                "${product.price.toStringAsFixed(2)} ${AppMessage.appCurrency}",
                                minFontSize: 15,
                                maxFontSize: 20,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppTheme.textBlackColor.withOpacity(.75),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                var data = await controller.setShopping(product, 0);
                                print(data);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                decoration: BoxDecoration(
                                  color: AppTheme.blackBackColor.withOpacity(.5),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  ),
                                ),
                                child: Icon(
                                  CupertinoIcons.cart_fill,
                                  color: AppTheme.iconWhiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
