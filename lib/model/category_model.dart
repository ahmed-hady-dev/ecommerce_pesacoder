class CategoryModel {
  String? name, image;

  CategoryModel({
    this.name,
    this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
