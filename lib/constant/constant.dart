import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_store/classes/categories.dart';

const appTitle = "iStore";
Color mainColor = Color(0xFFF0F0F0);

get getRandomColor => Color(Random().nextInt(0xFFFFFFFF)).withAlpha(0xFF).value;

List<Categories> categoriesList = [
  Categories(id: 1, title: "All"),
  Categories(id: 1, title: "Phone"),
  Categories(id: 1, title: "Laptop"),
  Categories(id: 1, title: "Desktop"),
  Categories(id: 1, title: "Battery"),
  Categories(id: 1, title: "Cables"),
  Categories(id: 1, title: "Accessories"),
];
