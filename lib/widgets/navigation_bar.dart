import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  final int index;
  final Function onTap;
  NavigationBar({this.index, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xff555555),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 90,
            spreadRadius: -15,
          ),
        ],
      ),
      child: BottomNavigationBar(
        onTap: onTap,
        elevation: 0,
        currentIndex: index,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(CupertinoIcons.house_alt),
            activeIcon: Icon(CupertinoIcons.house_alt_fill),
          ),
          BottomNavigationBarItem(
            label: "Categories",
            icon: Icon(CupertinoIcons.layers_alt),
            activeIcon: Icon(CupertinoIcons.layers_alt_fill),
          ),
          BottomNavigationBarItem(
            label: "Products",
            icon: Icon(CupertinoIcons.bag),
            activeIcon: Icon(CupertinoIcons.bag_fill),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(CupertinoIcons.person_alt_circle),
            activeIcon: Icon(CupertinoIcons.person_alt_circle_fill),
          ),
        ],
      ),
    );
  }
}
