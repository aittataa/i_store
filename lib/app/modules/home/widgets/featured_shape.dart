import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/modules/home/widgets/image_network.dart';

class FeaturedShape extends GetView<HomeController> {
  final HomeController controller;
  final Product product;
  final bool state;
  const FeaturedShape({
    Key? key,
    required this.controller,
    required this.product,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AnimatedContainer(
          duration: AppConstant.durationAnimated,
          curve: AppConstant.curve,
          margin: EdgeInsets.only(
            left: 15,
            top: 15,
            bottom: state ? 10 : 60,
          ),
          decoration: BoxDecoration(
            color: AppTheme.whiteBackColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [AppConstant.boxShadow],
          ),
          child: Stack(
            children: [
              Expanded(child: Center(child: ImageNetwork(image: product.image))),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    title: AutoSizeText(
                      "${product.model}",
                      minFontSize: 10,
                      maxFontSize: 20,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.textBlackColor.withOpacity(.75),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () => setState(() => {controller.setFavorite(product)}),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppTheme.blackBackColor.withOpacity(.5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          color: product.status ? AppTheme.iconRedColor : AppTheme.iconWhiteColor,
                        ),
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
                          onTap: () async {},
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
            ],
          ),
        );
      },
    );
  }
}
