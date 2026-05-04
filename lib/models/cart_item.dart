import 'package:famton_app/models/food.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  String get totalPrice {
    double addonsPrice = selectedAddons.fold(
      0,
      (sum, addon) => sum + double.parse(addon.price),
    );
    return "₹${(double.parse(food.price) + addonsPrice) * quantity}";
  }
}
