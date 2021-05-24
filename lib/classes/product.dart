import 'dart:convert';

import 'specs.dart';

Product productFromJson(String str) => Product.fromJson(jsonDecode(str));

String productToJson(Product data) => jsonEncode(data.toJson());

class Product {
  int id;
  String model;
  String image;
  double price;
  String manufacturer;
  String description;
  int stock;
  Specs specs;

  Product({
    this.id,
    this.model,
    this.image,
    this.price,
    this.manufacturer,
    this.description,
    this.stock,
    this.specs,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    manufacturer = json['manufacturer'];
    model = json['model'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    specs = json['specs'] != null ? new Specs.fromJson(json['specs']) : null;
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['manufacturer'] = this.manufacturer;
    data['model'] = this.model;
    data['image'] = this.image;
    data['price'] = this.price;
    data['description'] = this.description;
    data['stock'] = this.stock;
    if (this.specs != null) {
      data['specs'] = this.specs.toJson();
    }
    return data;
  }
}
