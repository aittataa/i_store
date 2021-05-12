import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_store/widgets/contain_body.dart';
import 'package:i_store/widgets/header_bar.dart';
import 'package:i_store/widgets/navigation_bar.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ContainBody(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderBar(),
              NavigationBar(
                index: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
