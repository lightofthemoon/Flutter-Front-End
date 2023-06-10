import 'dish_model.dart';
import 'size_model.dart';
import 'topping_model.dart';

class CartItem {
  final DishModel dish;
  final int quantity;
  final SizeModel size;
  final List<ToppingModel> toppings;

  CartItem({
    required this.dish,
    required this.quantity,
    required this.size,
    required this.toppings,
  });
  CartItem copyWith({
    DishModel? dish,
    int? quantity,
    SizeModel? size,
    List<ToppingModel>? toppings,
  }) {
    return CartItem(
      dish: dish ?? this.dish,
      quantity: quantity ?? this.quantity,
      size: size ?? this.size,
      toppings: toppings ?? this.toppings,
    );
  }
}
