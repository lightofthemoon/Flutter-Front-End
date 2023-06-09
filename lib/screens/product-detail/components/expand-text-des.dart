import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/model/dish_model.dart';

import '../../../configs/constant.dart';

class ExpandTextDescription extends StatefulWidget {
  const ExpandTextDescription({
    super.key,
    required this.dish,
  });

  final DishModel dish;

  @override
  State<ExpandTextDescription> createState() => _ExpandTextDescriptionState();
}

class _ExpandTextDescriptionState extends State<ExpandTextDescription> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      widget.dish.dishName!.replaceAll('"', ''),
      style: const TextStyle(fontSize: 18, height: 2),
      animationCurve: Curves.easeInOut,
      animation: true,
      animationDuration: kAnimationDuration,
      expandText: 'Xem chi tiết',
      collapseText: 'Thu gọn',
      linkStyle: const TextStyle(fontWeight: FontWeight.w600),
      maxLines: 3,
      linkColor: kPrimaryColor,
      expanded: isExpanded,
      onExpandedChanged: (value) {
        setState(() {
          isExpanded = value;
        });
      },
    );
  }
}
