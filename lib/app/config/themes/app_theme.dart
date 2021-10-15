import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  /// App Colors
  static const Color mainColor = Color(0xFFF0F0F0);
  static const Color blackBackColor = Color(0xFF000000);
  static const Color whiteBackColor = Color(0xFFFFFFFF);
  static const Color transparentColor = Color(0x00000000);

  /// App Colors
  static const Color iconBlackColor = Color(0xFF000000);
  static const Color iconWhiteColor = Color(0xFFFFFFFF);
  static const Color iconRedColor = Color(0xFFF44336);

  /// App Colors
  static const Color textBlackColor = Color(0xFF000000);
  static const Color textWhiteColor = Color(0xFFFFFFFF);

  static ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: AppTheme.mainColor,
          titleTextStyle: TextStyle(
            color: AppTheme.textBlackColor.withOpacity(.65),
            fontWeight: FontWeight.w900,
            fontSize: 25,
          )),
      scaffoldBackgroundColor: AppTheme.mainColor,
      primaryColor: AppTheme.mainColor,
      splashColor: AppTheme.mainColor,
    );
  }
}
