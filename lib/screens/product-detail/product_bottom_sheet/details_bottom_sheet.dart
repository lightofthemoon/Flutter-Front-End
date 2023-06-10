// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/model/dish_model.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/default_button.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';

import '../components/size_choices.dart';

class DishBottomSheet extends StatefulWidget {
  const DishBottomSheet({super.key});

  @override
  DishBottomSheetState createState() => DishBottomSheetState();
}

class DishBottomSheetState extends State<DishBottomSheet> {
  String _selectedSize = 'Small';
  List<String> _selectedToppings = [];

  final List<String> _sizes = ['Small', 'Medium', 'Large'];
  final List<String> _toppings = [
    'Pepperoni',
    'Mushrooms',
    'Onions',
    'Sausage',
    'Bacon',
    'Extra cheese',
    'Black olives',
    'Green peppers',
    'Pineapple',
    'Spinach'
  ];

  void _toggleTopping(String topping) {
    setState(() {
      if (_selectedToppings.contains(topping)) {
        _selectedToppings.remove(topping);
      } else {
        _selectedToppings.add(topping);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Chọn size',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Row(
            children: [
              for (String size in _sizes)
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSize = size;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: _selectedSize == size
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(child: Text(size)),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text('Choose toppings',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              for (String topping in _toppings)
                GestureDetector(
                  onTap: () {
                    _toggleTopping(topping);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: _selectedToppings.contains(topping)
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(topping),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: const Text('Add to cart'),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailsBottomSheet extends StatefulWidget {
  final DishModel dish;
  const OrderDetailsBottomSheet({required this.dish, Key? key})
      : super(key: key);
  @override
  OrderDetailsBottomSheetState createState() => OrderDetailsBottomSheetState();
}

class OrderDetailsBottomSheetState extends State<OrderDetailsBottomSheet> {
  String? selectedSize = '';
  @override
  Widget build(BuildContext context) {
    double total = 0;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.91,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.aspectRatio * 20),
                  child: Center(
                    child: Text(
                      "${widget.dish.dishName}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ScrollEdgeListener(
              edge: ScrollEdge.start,
              edgeOffset: 0,
              continuous: false,
              dispatch: true,
              listener: () {
                Navigator.pop(context);
              },
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.transparent,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.network("${widget.dish.image}"),
                      ),
                      const Divider(
                        thickness: 3,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: size.height / 18,
                        width: size.width,
                        child: StyledGradienButton(
                          onPressed: () {},
                          buttonText: 'Thêm vào giỏ',
                          buttonIconAssets: 'assets/images/cart_add.png',
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Chọn kích cỡ',
                                  style: GoogleFonts.nunito(fontSize: 16),
                                ),
                              ],
                            ),
                            SizeChoiceWidget(
                              onSizeSelected: (value) {
                                setState(() {
                                  selectedSize = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
