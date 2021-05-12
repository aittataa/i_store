import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final String image;
  final Color color;
  final Function onPressed;
  const ContactButton({this.image, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      color: Colors.white,
      elevation: 3,
      highlightElevation: 3,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.all(10),
      child: Image.asset(
        "images/$image",
        color: color,
        width: 25,
        height: 25,
      ),
    );
  }
}
