import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String appTitle = "iStore";
const String appIcon = "assets/images/app_icon.png";
const String appIconRound = "assets/images/app_icon_round.png";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
    );
  }
}
