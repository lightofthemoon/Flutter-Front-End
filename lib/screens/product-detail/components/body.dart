import 'package:flutter/material.dart';
import 'package:quanlyquantrasua/model/dish_model.dart';
import 'package:quanlyquantrasua/screens/product-detail/components/product-description.dart';
import 'package:quanlyquantrasua/screens/product-detail/components/rouded-container-desciption.dart';
import 'package:quanlyquantrasua/screens/product-detail/components/rounded-iconBtn.dart';
import '../../../configs/constant.dart';
import '../../../configs/size_config.dart';
import '../../../widgets/custom_widgets/default_button.dart';
import '../../../widgets/custom_widgets/show_loading_animation.dart';
import 'product-images.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.dish});
  final DishModel dish;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var numOfItem = 1;
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
            RoundedContainerDescription(
                color: kSecondaryColor.withOpacity(0.2),
                widget: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          const Spacer(),
                          RoundedIconBtn(
                            icon: Icons.remove,
                            press: () {
                              if (numOfItem == 1) {
                                return;
                              }
                              setState(() {
                                numOfItem--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'x $numOfItem',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RoundedIconBtn(
                            icon: Icons.add,
                            press: () {
                              setState(() {
                                numOfItem++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    RoundedContainerDescription(
                      color: Colors.white,
                      widget: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            top: 15,
                            bottom: 40,
                            right: SizeConfig.screenWidth * 0.15),
                        child: DefaultButton(
                          text: 'Add to cart',
                          press: () async {
                            try {
                              showLoadingAnimation(context);
                            } catch (e) {
                              throw Exception(e);
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ))
          ])
        ],
      ),
    ));
  }
}
