class Food {
  final String name; //cheese burger
  final String imagePath; //lip/image/cheese_burger.png
  final String price; // 4.99
  final String description; // a burger full of cheese
  final FoodCategory category; //burger
  List<Addon> availableAddons; //[extra cheese, sauce, extra patty]

  //constructor
  Food({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.category,
    required this.availableAddons,
  });
}

//food categories
enum FoodCategory { burgers, salads, sides, desserts, drinks }

//food addons
class Addon {
  final String name;
  final String price;

  Addon({required this.name, required this.price});
}
