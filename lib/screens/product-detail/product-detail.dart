import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:quanlyquantrasua/model/dish_model.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/custom_appbar.dart';

import '../../configs/constant.dart';
import '../../configs/size_config.dart';
import '../../widgets/custom_widgets/default_button.dart';
import '../../widgets/custom_widgets/show_loading_animation.dart';
import 'components/body.dart';
import 'components/rouded-container-desciption.dart';
import 'components/rounded-iconBtn.dart';
import 'components/size_choices.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.dish});
  final DishModel dish;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var numOfItem = 1;
  String? selectedSize = '';
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    Logger().i('product detail ${widget.dish.dishName}');
    return Scaffold(
      appBar: CustomAppBar(
          onPressed: () {
            Navigator.pop(context);
          },
          title: '${widget.dish.dishName}',
          appBarBackgroundColor: Colors.white),
      body: Column(
        children: [
          Body(
            dish: widget.dish,
          ),
          SizesChoice(
            onSizeSelected: (value) {
              setState(() {
                selectedSize = value;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: SizeConfig.screenHeight * 0.195,
        child: RoundedContainerDescription(
            color: kSecondaryColor.withOpacity(0.2),
            widget: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        top: SizeConfig.screenHeight * 0.015,
                        bottom: SizeConfig.screenHeight * 0.025,
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
            )),
      ),
    );
  }
}
