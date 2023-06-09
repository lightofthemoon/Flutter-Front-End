import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:quanlyquantrasua/model/dish_model.dart';

import '../../configs/size_config.dart';
import 'components/body.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.dish});
  final DishModel dish;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    Logger().i('product detail ${dish.dishName}');
    return Scaffold(
      body: Body(
        dish: dish,
      ),
    );
  }
}
