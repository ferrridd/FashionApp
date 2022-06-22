import 'package:flutter/material.dart';

class DataModel {
  final String title;
  final String imageName;
  final double price;
  List<bool> sizeList = List<bool>.filled(5, false);
  List<bool> colorList = List<bool>.filled(7, false);
  Color color = Colors.transparent;
  String size = "";
  DataModel({
    required this.title,
    required this.imageName,
    required this.price,
  });
}

List<DataModel> imageList = [
  DataModel(
      title: "Jeans", imageName: "assets/images/download-5.jpg", price: 300.8),
  DataModel(
      title: "Office Formals",
      imageName: "assets/images/download-2.jpg",
      price: 245.2),
  DataModel(
      title: "Black Hoodie",
      imageName: "assets/images/download-3.jpg",
      price: 168.2),
  DataModel(
      title: "Sweater",
      imageName: "assets/images/download-4.jpg",
      price: 136.7),
];
