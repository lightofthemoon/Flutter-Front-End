import 'package:flutter/material.dart';

import 'package:quanlyquantrasua/screens/product-detail/components/rouded-container-desciption.dart';

import '../../../model/dish_model.dart';
import 'expand-text-des.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.dish,
  });

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return RoundedContainerDescription(
      color: Colors.white,
      widget: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '${dish.dishName}',
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ExpandTextDescription(dish: dish),
        ),
      ]),
    );
  }
}
