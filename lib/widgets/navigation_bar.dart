import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_store/constant/messages.dart';

class NavigationBar extends StatelessWidget {
  final int index;
  final Function onTap;
  NavigationBar({this.index, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff555555),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
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
            label: Messages.LABEL_HOME,
            icon: Icon(CupertinoIcons.house_alt),
            activeIcon: Icon(CupertinoIcons.house_alt_fill),
          ),
          BottomNavigationBarItem(
            label: Messages.LABEL_CATEGORIES,
            icon: Icon(CupertinoIcons.layers_alt),
            activeIcon: Icon(CupertinoIcons.layers_alt_fill),
          ),
          BottomNavigationBarItem(
            label: Messages.LABEL_PRODUCTS,
            icon: Icon(CupertinoIcons.bag),
            activeIcon: Icon(CupertinoIcons.bag_fill),
          ),
          BottomNavigationBarItem(
            label: Messages.LABEL_PROFILE,
            icon: Icon(CupertinoIcons.person_alt_circle),
            activeIcon: Icon(CupertinoIcons.person_alt_circle_fill),
          ),
        ],
      ),
    );
  }
}
