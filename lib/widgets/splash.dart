import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/screens/initial_screen.dart';
import 'package:i_store/widgets/spink_indicator.dart';

class Splash extends StatelessWidget {
  const Splash();
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: InitialScreen(),
      splash: BouncePoint(),
      curve: Constant.curve,
      backgroundColor: mainColor,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Constant.duration,
    );
  }
}
