class CartProductModel {
  String? name, image, price, productId;
  int? quantity;
  CartProductModel({
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.productId,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['quantity'] = quantity;
    map['price'] = price;
    map['productId'] = productId;
    return map;
  }
}
