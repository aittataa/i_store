import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:i_store/constant/constant.dart';

class SpinkIndicator extends StatelessWidget {
  final double size;
  const SpinkIndicator({this.size = 64});
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: size,
      color: Colors.black54,
      duration: Constant.duration,
    );
  }
}
