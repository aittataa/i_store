import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/detail/controllers/detail_controller.dart';
import 'package:i_store/app/modules/detail/widgets/divider_line.dart';
import 'package:i_store/app/modules/detail/widgets/info_shape.dart';
import 'package:i_store/app/shared/image_network.dart';

class DetailShape extends GetView<DetailController> {
  final DetailController controller;
  final Product product;

  const DetailShape({
    Key? key,
    required this.controller,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: 400,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.whiteBackColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [AppConstant.boxShadow],
              ),
              child: Column(
                children: [
                  Expanded(child: ImageNetwork(image: product.image)),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.blackBackColor.withOpacity(.5)),
                    ),
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
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              horizontalTitleGap: 0,
              title: AutoSizeText(
                "Specifications",
                minFontSize: 10,
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
            DividerLine(),
            InfoShape(
              label: "Body",
              value: product.specs!.body!,
            ),
            DividerLine(),
            InfoShape(
              label: "Display",
              value: product.specs!.display!,
            ),
            DividerLine(),
            InfoShape(
              label: "Platform",
              value: product.specs!.platform!,
            ),
            DividerLine(),
            InfoShape(
              label: "Chipset",
              value: product.specs!.chipset!,
            ),
            DividerLine(),
            InfoShape(
              label: "Memory",
              value: product.specs!.memory!,
            ),
            DividerLine(),
            InfoShape(
              label: "Main Camera",
              value: product.specs!.camera!.main!,
            ),
            DividerLine(),
            InfoShape(
              label: "Selfie",
              value: product.specs!.camera!.selfie!,
            ),
            DividerLine(),
            InfoShape(
              label: "Camera's Features",
              value: product.specs!.camera!.features!,
            ),
            DividerLine(),
            InfoShape(
              label: "Battery",
              value: product.specs!.battery!,
            ),
            DividerLine(),
            InfoShape(
              label: "Features",
              value: product.specs!.features!,
            ),
            DividerLine(),
            InfoShape(
              label: "Description",
              value: product.description!,
            ),
          ],
        );
      },
    );
  }
}
