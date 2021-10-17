import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/shared/bounce_point.dart';

class ImageNetwork extends StatelessWidget {
  final String image;
  const ImageNetwork({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        // child: Image.network(image),
        // child: Image(image: CachedNetworkImageProvider(image)),
        child: CachedNetworkImage(
          imageUrl: image,
          progressIndicatorBuilder: (context, url, progress) => const BouncePoint(size: 25),
          errorWidget: (context, url, error) => Icon(Icons.error, color: AppTheme.iconRedColor),
        ),
      ),
    );
  }
}
