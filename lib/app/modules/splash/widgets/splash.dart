import 'package:flutter/material.dart';
import 'package:i_store/app/config/messages/app_message.dart';
import 'package:i_store/app/shared/bounce_point.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(AppMessage.appIconRound),
          ),
        ),
        Expanded(child: BouncePoint()),
      ],
    );
  }
}
