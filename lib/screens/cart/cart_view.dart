import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanlyquantrasua/screens/cart/components/edit_cartitem_bottomsheet.dart';
import 'package:quanlyquantrasua/screens/cart/components/edit_cartitem_button.dart';
import 'package:quanlyquantrasua/utils/format_currency.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/custom_appbar.dart';
import 'package:quanlyquantrasua/widgets/custom_widgets/transition.dart';
import '../../controller/cart_controller.dart';
import '../../widgets/custom_widgets/default_button.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const Text('Chọn tất cả'),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: size.width / 2.8,
                    height: size.height / 24,
                    margin: const EdgeInsets.only(right: 10),
                    child: DefaultButton(
                      enabled: cartController.isCheckAll,
                      press: () {
                        cartController.clearCart();
                      },
                      text: 'Xoá giỏ hàng',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = listItem[index];
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
                          cartController.checkedItem.remove(item);
                        });
                      },
                      child: ListTile(
                        leading: SizedBox(
                          height: size.height / 10,
                          width: size.width / 4,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 1,
                                right: 85,
                                child: Checkbox(
                                  value: cartController
                                              .queryChekedItemList(item) !=
                                          -1
                                      ? true
                                      : cartController.isCheckAll,
                                  onChanged: (value) {
                                    setState(() {
                                      cartController.isCheckAll = false;
                                      cartController.checkPerItem(item);
                                    });
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: SizedBox(
                                    height: size.height / 10,
                                    width: size.width / 5.5,
                                    child: Image.network(
                                      "${item.dish.image}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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
                              isEnabled:
                                  cartController.queryChekedItemList(item) ==
                                      -1,
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  builder: (BuildContext context) {
                                    return EditCartItemBottomSheet(
                                        cartItem: item);
                                  },
                                );
                              },
                            ),
                            Text(
                                ' ${formatCurrency(cartController.calculateItemTotal(item))}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
      bottomNavigationBar: Obx(
        () => CartBottomNavigation(
            onPaymentPressed: () {},
            totalPrice: cartController.totalPrice.value),
      ),
    );
  }
}

class CartBottomNavigation extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onPaymentPressed;

  CartBottomNavigation(
      {super.key, required this.totalPrice, required this.onPaymentPressed});
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tổng cộng: ${formatCurrency(totalPrice)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: onPaymentPressed,
              child: Text('Thanh toán', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
