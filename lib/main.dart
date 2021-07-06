import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/widgets/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black54,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Messages.APP_TITLE,
      color: mainColor,
      theme: ThemeData(
        primaryColor: mainColor,
        scaffoldBackgroundColor: mainColor,
      ),
      home: Splash(),
    );
  }
}
