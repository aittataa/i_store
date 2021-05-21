import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_store/constant/messages.dart';
import 'package:i_store/widgets/contain_body.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        leading: IconButton(
          onPressed: null,
          iconSize: 27,
          icon: Icon(
            CupertinoIcons.list_bullet_indent,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
        title: Text(
          Messages.APP_TITLE,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            iconSize: 27,
            icon: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: ContainBody(),
      bottomNavigationBar: NavigationBar(
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
