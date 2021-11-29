import 'package:flutter/material.dart';
import 'package:i_store/app/config/responses/app_response.dart';

class ResponseError extends StatelessWidget {
  final AppResponse response;
  const ResponseError({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: Text(
          "${response.messageServer}",
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          "${response.messageUser}",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
