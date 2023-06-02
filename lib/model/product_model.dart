class Product {
  int? dishid;
  String? dish_name;
  String? image;
  double? price;
  int? categoryid;
  int? sizeid;

  Product({
    this.dishid,
    this.dish_name,
    this.image,
    this.price,
    this.categoryid,
    this.sizeid,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      dishid: json['dishid'] as int,
      dish_name: json['dish_name'] as String,
      image: json['image'] as String,
      price: json['price'] as double,
      categoryid: json['categoryid'] as int,
      sizeid: json['sizeid'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dishid': dishid,
      'dish_name': dish_name,
      'image': image,
      'price': price,
      'categoryid': categoryid,
      'sizeid': sizeid,
    };
  }
}
