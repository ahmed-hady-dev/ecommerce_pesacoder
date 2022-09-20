import 'package:flutter/material.dart';

import '../helper/extensions.dart';

class ProductModel {
  String? name, image, description, size, price, productId;
  Color? color;
  ProductModel({
    this.name,
    this.image,
    this.description,
    this.color,
    this.size,
    this.price,
    this.productId,
  });

  ProductModel.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    image = json['image'];
    description = json['description'];
    color = HexColor.fromHex(json['color']);
    size = json['size'];
    price = json['price'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['color'] = color;
    map['size'] = size;
    map['price'] = price;
    map['productId'] = productId;
    return map;
  }
}
