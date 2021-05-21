import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/screens/initial_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Messages.APP_TITLE,
      color: mainColor,
      theme: ThemeData(
        primaryColor: mainColor,
        scaffoldBackgroundColor: mainColor,
      ),
      home: AnimatedSplashScreen(
        nextScreen: InitialScreen(),
        splash: SpinKitThreeBounce(
          size: 64,
          color: Colors.black54,
          duration: Constant.duration,
        ),
        curve: Constant.curve,
        backgroundColor: mainColor,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: Constant.duration,
      ),
    );
  }
}
