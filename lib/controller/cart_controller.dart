import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/cart_model.dart';

class CartController extends GetxController {
  List<CartItem> cartItem = <CartItem>[].obs;
  List<CartItem> checkedItem = <CartItem>[].obs;
  bool isCheckAll = false;
  void addToCart(CartItem item) {
    //Kiểm tra đối tượng Cartitem giống phương thức bên dưới
    final existingIndex = cartItem.indexWhere(
      (element) =>
          element.dish == item.dish &&
          element.size == item.size &&
          listEquals(element.toppings, item.toppings),
    );

    if (existingIndex != -1) {
      final existingItem = cartItem[existingIndex];
      final updatedItem =
          existingItem.copyWith(quantity: existingItem.quantity + 1);
      cartItem[existingIndex] = updatedItem;
    } else {
      cartItem.add(item.copyWith(quantity: 1));
    }
  }

  void checkAll() {
    if (isCheckAll == true) {
      checkedItem = List.from(cartItem);
    } else {
      checkedItem.clear();
    }
  }
  //Phương thức kiểm tra đối tượng item trong List checkedItem
  //Nếu kết quả trả về -1 -> đối tượng tồn tại, ngược lại thì đối tượng không tồn tại

  int queryChekedItemList(CartItem item) {
    return checkedItem.indexWhere(
      (element) =>
          element.dish == item.dish &&
          element.size == item.size &&
          listEquals(element.toppings, item.toppings),
    );
  }

  //Phương thức tick chọn từng item trong giỏ hàng
  void checkPerItem(CartItem item) {
    if (queryChekedItemList(item) != -1) {
      checkedItem.remove(item);
    } else {
      checkedItem.add(item);
    }
  }

  //Phương thức tính tổng sản phẩm đã chọn
  double totalChosenItem() {
    //Cộng dồn tổng tiền của toppings được chọn
    double totalToppings = checkedItem.fold(
        0.0,
        (previousValue, element) => element.toppings.fold(
            0.0,
            (previousValue, toppings) =>
                previousValue += (toppings.price ?? 0.0)));
    //Trả về tổng tiền của tất cả item được chọn
    return checkedItem.fold(
        0.0,
        (previousValue, element) => previousValue +=
            ((element.dish.price ?? 0.0)) +
                (element.size.price ?? 0.0) +
                totalToppings);
  }
}
