class ProductModel {
  String? name, image, description, color, size, price;

  ProductModel({
    this.name,
    this.image,
    this.description,
    this.color,
    this.size,
    this.price,
  });

  ProductModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    image = json['image'];
    description = json['description'];
    color = json['color'];
    size = json['size'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    map['color'] = color;
    map['size'] = size;
    map['price'] = price;
    return map;
  }
}
