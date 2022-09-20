class CartProductModel {
  String? name, image, price;
  int? quantity;
  CartProductModel({
    this.name,
    this.image,
    this.quantity,
    this.price,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['quantity'] = quantity;
    map['price'] = price;
    return map;
  }
}
