import 'dart:convert';

import 'package:i_store/app/data/models/specs.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

class Product {
  final int id;
  final String manufacturer;
  final String model;
  final String image;
  final int price;
  final String description;
  final int stock;
  final Specs specs;

  Product({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.image,
    required this.price,
    required this.description,
    required this.stock,
    required this.specs,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.parse(json["id"]),
      manufacturer: json["manufacturer"],
      model: json["model"],
      image: json["image"],
      price: json["price"],
      description: json["description"],
      stock: json["stock"],
      specs: Specs.fromJson(json["specs"]),
    );
  }
}
