import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/modules/home/controllers/home_controller.dart';
import 'package:i_store/app/shared/bounce_point.dart';

class ImageNetwork extends GetView<HomeController> {
  final String image;
  const ImageNetwork({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CachedNetworkImage(
        imageUrl: image,
        progressIndicatorBuilder: (context, url, progress) => const BouncePoint(size: 25),
        errorWidget: (context, url, error) => Icon(Icons.error, color: AppTheme.iconRedColor),
      ),
    );
  }
}
