import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/screens/cart/components/edit_cartitem_button.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    value: checkedItemFromList.length == listItem.length
                        ? checkedItemFromList.isNotEmpty
                        : cartController.isCheckAll,
                    onChanged: (value) {
                      setState(() {
                        cartController.isCheckAll = value ?? false;
                        cartController.checkAll();
                      });
                    },
                  ),
                  const Text('Check All'),
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
                          value: cartController.queryChekedItemList(item) != -1
                              ? true
                              : cartController.isCheckAll,
                          onChanged: (value) {
                            setState(() {
                              cartController.isCheckAll = false;
                              cartController.checkPerItem(item);
                            });
                          },
                        ),
                        title: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${item.quantity}x ${item.dish.dishName} - ",
                                style: const TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: "${item.size.sizeName}",
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text("${item.dish.categories?.categoryName}"),
                        trailing: Column(
                          children: [
                            EditCartItemButton(
                              onTap: () {},
                            ),
                            Text(
                                '\$${(item.quantity * (item.dish.price ?? 0.0)) + toppingTotal}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Checkout'),
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
