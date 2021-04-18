import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:i_store/constant/constant.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
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
                trailing: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Container(
              height: 25,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  String category = categoriesList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.linearToEaseOut,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedIndex == index ? Colors.black54 : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        "$category",
                        style: TextStyle(
                          color: selectedIndex == index ? Colors.black54 : Colors.black26,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
