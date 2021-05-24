import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiManager {
  static const String _REST_URL = "https://the-mobile-store.herokuapp.com/api/phones/";
  static getData() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(_REST_URL));
      var map = jsonDecode(response.body);
      print(map);
    } catch (e) {}
  }
}
