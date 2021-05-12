import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/screens/details_screen.dart';

class HeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 90,
              spreadRadius: -15,
            ),
          ],
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen()),
            );
          },
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
      ),
    );
  }
}
