import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:i_store/classes/categories.dart';
import 'package:i_store/constant/constant.dart';
import 'package:i_store/widgets/category_item.dart';
import 'package:i_store/widgets/header_bar.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  int selectedIndex = 0;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderBar(),
            Container(
              height: 25,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  Categories category = categoriesList[index];
                  return CategoryItem(
                    category: category,
                    state: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                controller: PageController(
                  initialPage: pageIndex,
                  viewportFraction: 0.75,
                  keepPage: false,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  bool state = pageIndex == index;
                  return AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linearToEaseOut,
                    margin: EdgeInsets.only(
                      right: 8,
                      left: 2,
                      top: 1,
                      bottom: state ? 0 : 75,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "$appTitle",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
