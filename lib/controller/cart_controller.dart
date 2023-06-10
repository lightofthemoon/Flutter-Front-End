import 'package:get/get.dart';

import '../model/cart_model.dart';

class CartController extends GetxController {
  List<CartItem> cartItem = <CartItem>[].obs;
  List<CartItem> checkedItem = <CartItem>[].obs;
  void addToCart(CartItem item) {
    if (cartItem.contains(item)) {
      final index = cartItem.indexWhere((element) => element == item);
      final updatedItem =
          cartItem[index].copyWith(quantity: cartItem[index].quantity + 1);
      cartItem[index] = updatedItem;
    } else {
      cartItem.add(item.copyWith(quantity: 1));
    }
  }
}
