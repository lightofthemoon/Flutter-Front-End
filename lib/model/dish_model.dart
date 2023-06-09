// ignore_for_file: non_constant_identifier_names
import 'category_model.dart';
import 'size_model.dart';

class DishModel {
  int? dishID;
  String? dishName;
  String? image;
  double? price;
  SizeModel? sizes;
  CategoryModel? categories;

  DishModel({
    this.dishID,
    this.dishName,
    this.image,
    this.price,
    this.sizes,
    this.categories,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> sizeJson = json['sizes'];
    SizeModel? sizeModel = SizeModel.fromJson(sizeJson);

    Map<String, dynamic> categoryJson = json['categories'];

    CategoryModel categoryModel = CategoryModel.fromJson(categoryJson);

    return DishModel(
      dishID: json['dishID'] as int,
      dishName: json['dishName'] as String,
      image: json['image'] as String,
      price: json['price'] as double,
      sizes: sizeModel,
      categories: categoryModel,
    );
  }

  Map<String, dynamic> toJson() => {
        'dishID': dishID,
        'dishName': dishName,
        'image': image,
        'price': price,
        'sizes': sizes != null ? sizes!.toJson() : null,
        'categories': categories!.toJson(),
      };
}
