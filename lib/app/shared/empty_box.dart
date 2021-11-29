import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(child: Icon(CupertinoIcons.creditcard_fill, size: 30));
  }
}
