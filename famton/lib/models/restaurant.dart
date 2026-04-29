import 'package:flutter/material.dart';
import 'food.dart';
import 'cart_item.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';


class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic Cheeseburger",
      description: "A juicy beef patty with melted cheddar cheese, fresh lettuce, and tomato.",
      imagePath: "lib/images/burgers/cheese_burger.png",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.49),
      ],
    ),
    Food(
      name: "Aloha Burger",
      description: "A tropical delight with grilled pineapple and teriyaki sauce.",
      imagePath: "lib/images/burgers/aloga_burger.png",
      price: 9.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 1.99),
        Addon(name: "Bacon", price: 1.99),
      ],
    ),
    Food(
      name: "BBQ Burger",
      description: "Smoky BBQ sauce and crispy onion rings on a beef patty.",
      imagePath: "lib/images/burgers/bbq_burger.png",
      price: 10.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 1.99),
      ],
    ),
    Food(
      name: "Blue Moon Burger",
      description: "Blue cheese and balsamic glaze for a unique gourmet experience.",
      imagePath: "lib/images/burgers/bluemoon_burger.png",
      price: 12.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 2.99),
      ],
    )
    Food(
      name: "Veggie Burger",
      description: "A hearty plant-based patty with all the classic fixings.",
      imagePath: "lib/images/burgers/vege_burger.png",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 2.99),
      ],
    ),
    // salads
    Food(
      name: "Classic Caesar Salad",
      description: "Fresh romaine lettuce, croutons, and parmesan cheese with Caesar dressing.",
      imagePath: "lib/images/salads/caosar_salad.png",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Bacon", price: 1.99),
      ],
    ),
    Food(
      name: "Greek Salad",
      description: "Fresh romaine lettuce, feta cheese, and Kalamata olives with Greek dressing.",
      imagePath: "lib/images/salads/greek_salad.png",
      price: 9.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Feta cheese", price: 1.99),
      ],
    ),
    Food(
      name: "South West Chicken Salad ",
      description: "Grilled chicken, black beans, corn, and avocado with a spicy ranch dressing.",
      imagePath: "lib/images/salads/southwest salad.png",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Feta cheese", price: 1.99),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      description: "Quinoa, black beans, corn, and avocado with lime dressing.",
      imagePath: "lib/images/salads/quinoa_salad.png",
      price: 11.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 2.99),
        Addon(name: "Feta cheese", price: 1.99),
      ],
    ),
    // sides
    Food(
      name: "Garlic Bread",
      description: "Warm and crusty bread topped with garlic butter and herbs.",
      imagePath: "lib/images/sides/garlic_bread_side.png",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 2.99),
        Addon(name: "Marinara sauce", price: 1.99),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Golden and crispy onion rings served with a side of ranch.",
      imagePath: "lib/images/sides/onion_rings_side.png",
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra ranch", price:10.99),
        Addon(name: "Spicy mayo", price: 2.99),
      ],
    ),
    Food(
      name: "Loaded Fries",
      description: "A delightful blend of crispy french fries with cheese sauce and bacon bits.",
      imagePath: "lib/images/sides/loaded_fries_side.png",
      price: 5.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 11.49),
        Addon(name: "Bacon bits", price: 10.99),
      ],
    ),
    Food(
      name: "Sweet Potato",
      description: "Crispy sweet potato fries with a touch of salt.",
      imagePath: "lib/images/sides/sweet_potato_side.png",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cinnamon sugar", price: 2.49),
        Addon(name: "Maple syrup", price: 1.99),
      ],
    ),
    Food(
      name: "Mac & Cheese",
      description: "A delightful blend of macaroni pasta with cheese sauce and bacon bits.",
      imagePath: "lib/images/sides/mac_cheese.png",
      price: 6.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Bacon bits", price: 1.99),
        Addon(name: "Jalapenos", price: 1.49),
      ],
    ),

    // desserts
    Food(
      name: "Chocolate Brownie",
      description: "Rich and fudgy chocolate brownie topped with chocolate chips.",
      imagePath: "lib/images/desserts/chocolate_dessert .png",
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla ice cream", price: 1.99),
        Addon(name: "Caramel drizzle", price: 2.49),
      ],
    ),
    Food(
      name: "Cheesecake",
      description: "Creamy New York style cheesecake with a graham cracker crust.",
      imagePath: "lib/images/desserts/cheese_cake_dessert.png",
      price: 6.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Strawberry topping", price: 1.99),
        Addon(name: "Whipped cream", price: 2.49),
      ],
    ),
    Food(
      name: "Apple Pie",
      description: "Warm apple pie with a flaky crust and cinnamon-spiced apples.",
      imagePath: "lib/images/desserts/apple_pie_dessert.png",
      price: 5.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Scoop of ice cream", price: 1.99),
        Addon(name: "Cheddar cheese", price: 2.99),
      ],
    ),
    Food(
      name: "Black Forest Cake",
      description: "Layers of chocolate sponge cake, whipped cream, and cherries.",
      imagePath: "lib/images/desserts/black_forest_cake_dessert.png",
      price: 7.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cherries", price: 2.99),
      ],
    ),
    Food(
      name: "Red Velvet Lava Cake",
      description: "Warm red velvet cake with a molten chocolate center.",
      imagePath: "lib/images/desserts/red_valvet_lava_cake_dessert.png",
      price: 8.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla bean ice cream", price: 2.99),
      ],
    ),

    // drinks
    Food(
      name: "Lemonade",
      description: "Refreshing lemonade made with real lemon and a touch of sweetness.",
      imagePath: "lib/images/drinks/lemonade_drink.png",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Strawberry flavor", price: 1.99),
        Addon(name: "Mint leaves", price: 1.49),
        Addon(name: "Ginger Zest", price: 1.99),
      ],
    ),
    Food(
      name: "Iced Tea",
      description: "Chilled iced tea with a hint of lemon, served over ice.",
      imagePath: "lib/images/drinks/iced_tea_drink.png",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Peach flavor", price: 2.99),
        Addon(name: "Lemon Slice", price: 1.49),
        Addon(name: "Honey", price: 1.99),
      ],
    ),
    Food(
      name: "Smoothie",
      description: "A blend of fresh fruits and yogurt, perfect for a healthy boost.",
      imagePath: "lib/images/drinks/smoothie_drink.png",
      price: 5.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein powder", price: 2.99),
        Addon(name: "Almont Milk", price: 1.49),
        Addon(name: "Chia seeds", price: 1.99),
      ],
    ),
    Food(
      name: "Mojito",
      description: "A classic Cuban cocktail with muddled lime and mint, sweetened with sugar.",
      imagePath: "lib/images/drinks/mojito_drink.png",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Mint", price: 1.49),
        Addon(name: "Raspberry Puree", price: 2.99),
        Addon(name: "Splash of Coconut Rum", price: 1.99),
      ],
    ),
    Food(
      name: "Caramel Macchiato",
      description: "A Layer coffee drink steamed milk, espresso, and vanilla syrup.",
      imagePath: "lib/images/drinks/caramel_macchiato_drink.png",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Shot of Espresso", price: 1.99),
        Addon(name: "Hazelnut Syrup", price: 1.99),
        Addon(name: "Whipped Cream", price: 2.99),
      ],
    ), 
 ];


  // user cart
  final List<CartItem> _cart = [];

  // delivery address (which user can change/update)
  String _deliveryAddress = 'Karupanan Street';

  /*
  
  G E T T E R S
  
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  
  O P E R A T I O N S
  
  */

  // Add to Cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // Remove from Cart
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

  // Get Total Price of cart  
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // Get Total number of items in cart 
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // Clear Cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

void updateDeliveryAddress(String address) {
  _deliveryAddress = address;
  notifyListeners();
}
  /*
  
  H E L P E R S
  
  */

  // generate receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds
    String formattedDate =
         DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now()); 

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-ons: ${formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("total item: ${getTotalItemCount()}");
    receipt.writeln("total price: ${formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivery to: $_deliveryAddress");


    return receipt.toString();
  }

  // Format double value into money 
  String formatPrice(double price) {
    return "\$" + price.toStringAsFixed(2);
  }

  // Format list of addons into a string summary
  String formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${formatPrice(addon.price)})")
        .join(", ");
  }
}
