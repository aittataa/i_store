import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/constant/constant.dart';

class NavigationBar extends StatelessWidget {
  final int index;
  final Function onTap;
  NavigationBar({this.index, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: BottomNavigationBar(
          onTap: onTap,
          elevation: 0,
          currentIndex: index,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black45,
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
      ),
    );
  }
}
