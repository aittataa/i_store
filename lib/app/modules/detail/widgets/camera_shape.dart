import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/data/models/camera.dart';
import 'package:i_store/app/modules/detail/widgets/specs_shape.dart';

class CameraShape extends StatelessWidget {
  final Camera camera;
  const CameraShape({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      minVerticalPadding: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AutoSizeText(
          "Camera : ",
          minFontSize: 15,
          maxFontSize: 20,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppTheme.textBlackColor.withOpacity(.64),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      subtitle: Column(
        children: [
          SpecsShape(label: "Main Camera", value: camera.main!),
          SpecsShape(label: "Camera Selfie", value: camera.selfie!),
          SpecsShape(label: "Camera Features", value: camera.features!),
        ],
      ),
    );
  }
}
