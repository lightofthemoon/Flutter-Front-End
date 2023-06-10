import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/model/dish_model.dart';
import 'package:quanlyquantrasua/screens/product-detail/components/product-description.dart';
import 'product-images.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.dish});
  final DishModel dish;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ProductImage(imageUrl: widget.dish.image ?? ''),
          Column(children: [
            ProductDescription(dish: widget.dish),
          ]),
        ],
      ),
    ));
  }
}
