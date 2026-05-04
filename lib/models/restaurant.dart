import 'package:famton_app/models/cart_item.dart';
import 'package:famton_app/models/food.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // ─── Menu ──────────────────────────────────────────────────────────────────

  final List<Food> _menu = [
    // B U R G E R S
    Food(
      name: "Classic Burger",
      description:
          "A juicy beef patty with fresh lettuce, tomato, and our secret sauce.",
      imagePath: "lib/images/burgers/classic_burger.png",
      price: 8.99,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addons(name: "Extra Patty", price: 3.00),
        Addons(name: "Extra Cheese", price: 1.00),
        Addons(name: "Bacon", price: 1.50),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "Smoky BBQ sauce, crispy bacon, cheddar cheese and caramelised onions.",
      imagePath: "lib/images/burgers/bbq_bacon_burger.png",
      price: 11.49,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addons(name: "Extra Bacon", price: 1.50),
        Addons(name: "Jalapeños", price: 0.75),
        Addons(name: "Avocado", price: 1.25),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A plant-based patty with roasted peppers, spinach and vegan mayo.",
      imagePath: "lib/images/burgers/veggie_burger.png",
      price: 9.49,
      category: FoodCategory.burgers,
      avilableAddons: [
        Addons(name: "Extra Patty", price: 3.00),
        Addons(name: "Vegan Cheese", price: 1.00),
      ],
    ),

    // S A L A D S
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine, parmesan shavings, croutons and Caesar dressing.",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: 7.99,
      category: FoodCategory.salads,
      avilableAddons: [
        Addons(name: "Grilled Chicken", price: 3.00),
        Addons(name: "Extra Dressing", price: 0.50),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "Tomatoes, cucumbers, olives, red onion and feta with olive oil.",
      imagePath: "lib/images/salads/greek_salad.png",
      price: 8.49,
      category: FoodCategory.salads,
      avilableAddons: [
        Addons(name: "Extra Feta", price: 1.00),
        Addons(name: "Grilled Shrimp", price: 4.00),
      ],
    ),

    // S I D E S
    Food(
      name: "French Fries",
      description: "Golden crispy fries with sea salt.",
      imagePath: "lib/images/sides/fries.png",
      price: 3.49,
      category: FoodCategory.sides,
      avilableAddons: [
        Addons(name: "Cheese Sauce", price: 0.75),
        Addons(name: "Chilli Flakes", price: 0.25),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Beer-battered onion rings served with dipping sauce.",
      imagePath: "lib/images/sides/onion_rings.png",
      price: 4.49,
      category: FoodCategory.sides,
      avilableAddons: [
        Addons(name: "Extra Sauce", price: 0.50),
      ],
    ),

    // D E S S E R T S
    Food(
      name: "Chocolate Lava Cake",
      description: "Warm chocolate cake with a gooey molten centre.",
      imagePath: "lib/images/desserts/lava_cake.png",
      price: 5.99,
      category: FoodCategory.desserts,
      avilableAddons: [
        Addons(name: "Vanilla Ice Cream", price: 1.50),
        Addons(name: "Whipped Cream", price: 0.75),
      ],
    ),
    Food(
      name: "Cheesecake",
      description: "New York–style cheesecake with a buttery biscuit base.",
      imagePath: "lib/images/desserts/cheesecake.png",
      price: 5.49,
      category: FoodCategory.desserts,
      avilableAddons: [
        Addons(name: "Strawberry Sauce", price: 0.75),
        Addons(name: "Blueberry Compote", price: 0.75),
      ],
    ),

    // D R I N K S
    Food(
      name: "Fresh Lemonade",
      description: "Hand-squeezed lemonade with a hint of mint.",
      imagePath: "lib/images/drinks/lemonade.png",
      price: 2.99,
      category: FoodCategory.drinks,
      avilableAddons: [
        Addons(name: "Extra Mint", price: 0.25),
        Addons(name: "Ginger Shot", price: 0.50),
      ],
    ),
    Food(
      name: "Mango Smoothie",
      description: "Blended mango, banana, and coconut milk.",
      imagePath: "lib/images/drinks/mango_smoothie.png",
      price: 3.99,
      category: FoodCategory.drinks,
      avilableAddons: [
        Addons(name: "Protein Boost", price: 1.00),
        Addons(name: "Chia Seeds", price: 0.50),
      ],
    ),
  ];

  // ─── Getters ───────────────────────────────────────────────────────────────

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // ─── Cart ──────────────────────────────────────────────────────────────────

  final List<CartItem> _cart = [];

  /// Add an item to the cart. If the same food + same addons already exists,
  /// increment quantity instead of adding a duplicate entry.
  void addToCart(Food food, List<Addons> selectedAddons) {
    CartItem? existingItem;

    for (var cartItem in _cart) {
      bool sameFood = cartItem.food == food;
      bool sameAddons = _listsEqual(cartItem.selectedAddons, selectedAddons);

      if (sameFood && sameAddons) {
        existingItem = cartItem;
        break;
      }
    }

    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  /// Remove one unit of a cart item. Deletes the entry when quantity reaches 0.
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  /// Wipe the entire cart.
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // ─── Helpers ───────────────────────────────────────────────────────────────

  /// Total price of everything in the cart.
  double get totalPrice {
    return _cart.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  /// Total number of individual items in the cart.
  int get totalItemCount {
    return _cart.fold(0, (sum, item) => sum + item.quantity);
  }

  /// Display-ready receipt string.
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your order:");
    receipt.writeln();

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name}"
        " – \$${cartItem.totalPrice.toStringAsFixed(2)}",
      );

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
          "   Add-ons: ${cartItem.selectedAddons.map((a) => a.name).join(', ')}",
        );
      }
    }

    receipt.writeln();
    receipt.writeln("Total: \$${totalPrice.toStringAsFixed(2)}");

    return receipt.toString();
  }

  /// Deep-equality check for two addon lists.
  bool _listsEqual(List<Addons> a, List<Addons> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i].name != b[i].name) return false;
    }
    return true;
  }
}
