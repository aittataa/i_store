import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/detail/controllers/detail_controller.dart';
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
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteBackColor.withOpacity(.85),
          ),
          child: Expanded(child: ImageNetwork(image: product.image)),
        );
      },
    );
  }
}
