import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/constant/constant.dart';

class HeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        leading: Icon(
          CupertinoIcons.list_bullet_indent,
          size: 30,
          color: Colors.black54,
        ),
        title: Text(
          "$appTitle",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
        trailing: Icon(
          Icons.search,
          color: Colors.black54,
          size: 30,
        ),
      ),
    );
  }
}
