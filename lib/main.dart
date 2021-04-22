import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/screens/initial_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "$appTitle",
      color: mainColor,
      theme: ThemeData.dark().copyWith(
        primaryColor: mainColor,
        scaffoldBackgroundColor: backColor,
      ),
      home: InitialScreen(),
    );
  }
}
