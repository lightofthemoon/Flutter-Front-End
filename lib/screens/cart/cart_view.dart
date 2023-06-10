import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/screens/product-detail/components/quantity_select.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/custom_appbar.dart';
import '../../controller/cart_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  final cartController = Get.find<CartController>();
  bool checkAll = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        title: 'Giỏ hàng của tôi',
        appBarBackgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (cartController.cartItem.isNotEmpty) {
          final listItem = cartController.cartItem;
          var checkedItemFromList = cartController.checkedItem;
          return Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: checkAll,
                    onChanged: (value) {
                      setState(() {
                        checkAll = value!;
                        if (value) {
                          checkedItemFromList = List.from(listItem);
                        } else {
                          checkedItemFromList.clear();
                        }
                      });
                    },
                  ),
                  Text('Check All'),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = listItem[index];
                    double toppingTotal = item.toppings.fold(
                        0.0,
                        (previousValue, element) =>
                            previousValue + (element.price ?? 0.0));
                    return Dismissible(
                      key: Key(item.hashCode.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          listItem.removeAt(index);
                        });
                      },
                      child: ListTile(
                        leading: Checkbox(
                          value: checkedItemFromList.contains(item),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                checkedItemFromList.add(item);
                              } else {
                                checkedItemFromList.remove(item);
                              }
                            });
                          },
                        ),
                        title: Text("${item.dish.dishName}"),
                        subtitle: Text("${item.dish.categories?.categoryName}"),
                        trailing: Column(
                          children: [
                            Text(
                                '\$${(item.quantity * (item.dish.price ?? 0.0)) + toppingTotal}'),
                            Text("${item.quantity}")
                            // QuantitySelector(initialValue: item.quantity, onValueChanged: (newquantity) {

                            // },)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement checkout logic
                },
                child: Text('Checkout'),
              ),
            ],
          );
        }
        return Center(
          child: Text(
            'Chưa có sản phẩm trong giỏ :((',
            style: GoogleFonts.roboto(fontSize: 22),
          ),
        );
      }),
    );
  }
}
