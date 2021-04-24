import 'package:flutter/material.dart';
import 'package:i_store/constant/constant.dart';

class SplitTitle extends StatelessWidget {
  final String title;
  const SplitTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Container(
        width: 10,
        decoration: BoxDecoration(
          color: Color(getRandomColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: Text(
        "$title",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w900,
          fontSize: 18,
        ),
      ),
      // trailing: Container(
      //   padding: EdgeInsets.all(5),
      //   decoration: BoxDecoration(
      //     color: Colors.black54,
      //     borderRadius: BorderRadius.circular(5),
      //   ),
      //   child: Text(
      //     "More",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    );
  }
}
