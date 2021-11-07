import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:i_store/app/config/constants/app_constant.dart';
import 'package:i_store/app/config/themes/app_theme.dart';
import 'package:i_store/app/modules/home/views/home_view.dart';
import 'package:i_store/app/shared/bounce_point.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const BouncePoint(),
      nextScreen: HomeView(),
      curve: AppConstant.curve,
      backgroundColor: AppTheme.whiteBackColor,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: AppConstant.durationSplash,
      splashIconSize: double.infinity,
    );
  }
}
