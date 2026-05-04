import 'package:famton_app/models/food.dart';

class CartItem {
  Food food;
  List<Addons> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsTotal =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsTotal) * quantity;
  }
}
