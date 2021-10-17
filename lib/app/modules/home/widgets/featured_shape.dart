import 'package:flutter/material.dart';
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/product.dart';
import 'package:i_store/app/modules/home/widgets/image_network.dart';

class FeaturedShape extends StatelessWidget {
  final bool state;
  final Product product;
  const FeaturedShape({Key? key, required this.product, this.state = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppConstant.durationAnimated,
      curve: AppConstant.curve,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.whiteBackColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: Column(
        children: [
          Expanded(
            child: ImageNetwork(image: product.image),
            /*
            child: Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppTheme.whiteBackColor, width: .5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                //child: Image.network(product.image, fit: BoxFit.fill),
                // child: Image(image: CachedNetworkImageProvider(product.image), fit: BoxFit.cover),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  progressIndicatorBuilder: (context, url, progress) => const BouncePoint(size: 25),
                  errorWidget: (context, url, error) => Icon(Icons.error, color: AppTheme.iconRedColor),
                ),
              ),
            ),
            */
          ),
        ],
      ),
    );
  }
}
