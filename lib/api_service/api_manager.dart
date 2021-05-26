import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:i_store/classes/product.dart';

class ApiManager {
  static const String _REST_URL = "https://the-mobile-store.herokuapp.com/api/phones";
  static getData() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(_REST_URL));
      if (response.statusCode == 200) {
        var myList = jsonDecode(response.body);
        return List.generate(myList.length, (index) => Product.fromJson(myList[index]));
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static getByID(int id) async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse("$_REST_URL/$id"));
      if (response.statusCode == 200) {
        var myList = jsonDecode(response.body);
        return Product.fromJson(myList);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }
}
