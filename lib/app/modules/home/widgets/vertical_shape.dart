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

class VerticalShape extends StatelessWidget {
  final HomeController controller;
  final Product product;
  const VerticalShape({
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
            Get.to(() => DetailView(product: product));
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.whiteBackColor.withOpacity(.85),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [AppConstant.boxShadow],
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(child: ImageNetwork(image: product.image)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: AutoSizeText(
                        "${product.model}",
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
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                var data = await controller.setShopping(product, 0);
                                print(data);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() => {product.updateStatus});
                    var data = await controller.setFavorite(product);
                    print(data);
                  },
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
              ],
            ),
          ),
        );
      },
    );
  }
}
