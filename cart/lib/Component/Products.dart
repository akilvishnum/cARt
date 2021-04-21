import 'package:flutter/cupertino.dart';

class Products {
  String productId;
  String productName;
  String productType;
  String category;
  int price;
  String description;
  List<String> variants;
  List<String> colorName;
  List<String> colorHex;
  Map<String, dynamic> specification;
  int count;
  HSLColor light, dark;
  Products({
    this.productId,
    this.productName,
    this.productType,
    this.category,
    this.price,
    this.description,
    this.variants,
    this.colorName,
    this.colorHex,
    this.specification,
    this.count,
    this.light,
    this.dark,
  });
}
