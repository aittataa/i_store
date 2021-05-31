import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/widgets/animated_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
