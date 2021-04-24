import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_store/widgets/contain_body.dart';
import 'package:i_store/widgets/header_bar.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ContainBody(),
          HeaderBar(),
        ],
      ),
    );
  }
}
