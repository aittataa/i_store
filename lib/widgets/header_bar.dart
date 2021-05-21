import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/constant/messages.dart';

class HeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [Constant.boxShadow],
        ),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          leading: Icon(
            CupertinoIcons.list_bullet_indent,
            color: Colors.black54,
            size: 30,
          ),
          title: Text(
            Messages.APP_TITLE,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          trailing: Icon(
            CupertinoIcons.cart_fill,
            color: Colors.black54,
            size: 30,
          ),
        ),
      ),
    );
  }
}
