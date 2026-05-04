import 'food.dart';
import 'package:flutter/foundation.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burger
    Food(
      name: "Classic Chesseburger",
      imagePath: "lib/images/burgers/cheese_burger.png",
      price: '0.99',
      description:
          "A juicy beef patty with melted chedder, lettuce, tomato,and a hint oninon and pickle",
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: '0.99'),
        Addon(name: "Bacon", price: '1.99'),
        Addon(name: "Avocado", price: '2.99'),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      imagePath: "lib/images/burgers/bbq_burger.png",
      price: '10.99',
      description:
          "Smoky BBQ sauce,crispy onion,and onion rings make this beef burger a savory delight",
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Grilled onions", price: '0.99'),
        Addon(name: "Jalapenos", price: '1.49'),
        Addon(name: "Extra BBQ Sauce", price: '1.99'),
      ],
    ),
    Food(
      name: "Veggie Burger",
      imagePath: "lib/images/burgers/vege_burger.png",
      price: '9.49',
      description:
          "A hearty veggie patty topped with fresh avacado,lettuce and tomato, served on a whole wheat bun",
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Vegan cheese", price: '0.99'),
        Addon(name: "Grilled Mushrooms", price: '1.49'),
        Addon(name: "Hummus Spread", price: '1.99'),
      ],
    ),
    Food(
      name: "Aloha Burger",
      imagePath: "lib/images/burgers/aloha_burger.png",
      price: '9.49',
      description:
          "A char-grilled chicken breast topped with a slice of grilled pineapple, swiss cheese, and teriyaki aioli",
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Teriyaki Glaze", price: '0.99'),
        Addon(name: "Extra Pineapple", price: '0.99'),
        Addon(name: "Bacon", price: '1.49'),
      ],
    ),
    Food(
      name: "Blue Moon Burger",
      imagePath: "lib/images/burgers/blue_moon_burger.png",
      price: '9.49',
      description:
          "This burger is a blue cheese lover's dream. It features our signature beef patty topped with creamy blue cheese",
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Sauteed Mushrooms", price: '0.99'),
        Addon(name: "Fried Egg", price: '1.49'),
        Addon(name: "Spicy mayo", price: '0.99'),
      ],
    ),

    //salads
    Food(
      name: "Caesar Salad",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: '7.99',
      description:
          "Crispy roman lettuce,shaved parmesan,croutons,and creamy Caesar dressing",
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: '0.99'),
        Addon(name: "Anchovies", price: '1.49'),
        Addon(name: "Extra parmesan", price: '1.99'),
      ],
    ),
    Food(
      name: "Greek Salad",
      imagePath: "lib/images/salads/greek_salad.png",
      price: '8.49',
      description:
          "Crisp romaine,cucumbers,tomatoes,feta cheese,kalamata olives,and red onion with a red wine vinaigrette",
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: " Feta Cheese", price: '0.99'),
        Addon(name: "Kalamata Olives", price: '1.49'),
        Addon(name: "Grilled shrimp", price: '2.99'),
      ],
    ),
    Food(
      name: "Quinoa Salad",
      imagePath: "lib/images/salads/quinoa_salad.png",
      price: '9.49',
      description:
          "A hearty and nutritious salad featuring protein-rich quinoa, black beans, corn, red bell peppers, and a zesty lime vinaigrette",
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Avocado", price: '0.99'),
        Addon(name: "Feta cheese", price: '1.49'),
        Addon(name: "Add Corn", price: '1.99'),
      ],
    ),
    Food(
      name: "Asian Sesame Salad",
      imagePath: "lib/images/salads/asian_sesame_salad.png",
      price: '9.99',
      description:
          "A blend of crisp greens, shredded cabbage, mandarin oranges, edamame, and crunchy noodles tossed in a tangy sesame ginger dressing",
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Mandarian Oranges", price: '0.99'),
        Addon(name: "Almond Silvers", price: '1.49'),
        Addon(name: "Extra Teriyaki chicken", price: '1.99'),
      ],
    ),
    Food(
      name: "South West Chicken Salad",
      imagePath: "lib/images/salads/southwest_salad.png",
      price: '9.99',
      description:
          "Mixed greens topped with grilled chicken, black beans, corn, red bell peppers, cheddar cheese, and tortilla strips, drizzled with a zesty chipotle ranch dressing",
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Sour Cream", price: '0.99'),
        Addon(name: "Pico de Gallo", price: '1.49'),
        Addon(name: "Guacamole", price: '1.99'),
      ],
    ),

    //sides
    Food(
      name: "Sweet Potato Fries",
      imagePath: "lib/images/sides/sweet_potato_fries.png",
      price: '4.99',
      description:
          "Crispy on the outside, fluffy on the inside, and seasoned with our signature spice blend. A healthier alternative to regular fries.",
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: '0.99'),
        Addon(name: "Triffle oil", price: '1.49'),
        Addon(name: "Cajun Spice", price: '1.99'),
      ],
    ),
    Food(
      name: "Onion Rings",
      imagePath: "lib/images/sides/onion_rings.png",
      price: '3.99',
      description:
          "Thick-cut spanish onion rings,dipped in a seasoned batter and fried to a golden crisp. served with a zesty dipping sauce",
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Ranch Dip", price: '0.99'),
        Addon(name: "Spicy Mayo", price: '1.49'),
        Addon(name: "Parmesan Dust", price: '1.99'),
      ],
    ),
    Food(
      name: "Garlic Bread",
      imagePath: "lib/images/sides/garlic_bread.png",
      price: '4.49',
      description:
          "French bread slices brushed with garlic butter and sprinkled with parmesan cheese",
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Garlic", price: '0.99'),
        Addon(name: " Mozzarella Cheese", price: '1.49'),
        Addon(name: "Marinara Dip", price: '1.99'),
      ],
    ),
    Food(
      name: "Loaded Fries",
      imagePath: "lib/images/sides/loaded_fries.png",
      price: '4.49',
      description:
          "A generous portion of our crispy golden fries loaded with melted cheddar cheese, crumbled bacon, chopped chives, and a drizzle of sour cream",
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Sour Cream", price: '0.99'),
        Addon(name: "Bacon Bits", price: '1.49'),
        Addon(name: "Green Onions", price: '0.99'),
      ],
    ),
    Food(
      name: "Crispy Mac & Cheese Bits",
      imagePath: "lib/images/sides/mac_side.png",
      price: '4.49',
      description:
          "Crispy, golden-fried bites filled with creamy macaroni and cheese. Perfect for sharing or as a standalone snack",
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Bacon Bits", price: '0.99'),
        Addon(name: "Jalapeno Slices", price: '1.49'),
        Addon(name: "Sriracha Drizzle", price: '0.99'),
      ],
    ),

    //dessert
    Food(
      name: " Chocolate Brownie ",
      imagePath: "lib/images/desserts/brownie_dessert.png",
      price: '5.99',
      description:
          "A rich, fudgy chocolate brownie baked to perfection and drizzled with warm chocolate sauce. A decadent treat for chocolate lovers.",
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: '0.99'),
        Addon(name: "Hot Fudge", price: '1.49'),
        Addon(name: "Whiped cream", price: '1.99'),
      ],
    ),
    Food(
      name: "Cheese cake ",
      imagePath: "lib/images/desserts/cheesecake_dessert.png",
      price: '6.99',
      description:
          "A rich, fudgy chocolate brownie baked to perfection and drizzled with warm chocolate sauce. A decadent treat for chocolate lovers.",
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Staberry topping", price: '0.99'),
        Addon(name: "blueberry compote", price: '1.49'),
        Addon(name: "Chocolate chips", price: '1.99'),
      ],
    ),
    Food(
      name: "Apple Pie",
      imagePath: "lib/images/desserts/apple_pie_dessert.png",
      price: '5.49',
      description:
          "A flaky pastry filled with tender, cinnamon-spiced apples, baked to golden-brown perfection. A timeless classic served warm.",
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Caramel sauce", price: '0.99'),
        Addon(name: "Vannila ice cream", price: '1.99'),
        Addon(name: "Cinnamon spice", price: '2.99'),
      ],
    ),
    Food(
      name: "Red Velvet Lava Cake",
      imagePath: "lib/images/desserts/redvelvet_lava_dessert.png",
      price: '5.49',
      description:
          "Indulge in our decadent Red Velvet Lava Cake, featuring a moist, velvety red velvet cake with a molten chocolate center that flows out with every bite. Topped with a dusting of powdered sugar and served with a dollop of fresh whipped cream. A perfect ending to any meal!",
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Roseberry sauce", price: '0.99'),
        Addon(name: "Cream Cheese icing", price: '1.99'),
        Addon(name: "Chocolate Sprinkles", price: '2.99'),
      ],
    ),
    Food(
      name: "Flooda",
      imagePath: "lib/images/desserts/flooda_dessert.png",
      price: '5.49',
      description:
          "Indulge in our decadent Red Velvet Lava Cake, featuring a moist, velvety red velvet cake with a molten chocolate center that flows out with every bite. Topped with a dusting of powdered sugar and served with a dollop of fresh whipped cream. A perfect ending to any meal!",
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Roseberry sauce", price: '0.99'),
        Addon(name: "Cream Cheese icing", price: '1.99'),
        Addon(name: "Chocolate Sprinkles", price: '2.99'),
      ],
    ),

    //drinks
    Food(
      name: "Lemonade",
      imagePath: "lib/images/drinks/lemonade_drink.png",
      price: '2.99',
      description:
          "A refreshing lemonade made with fresh lemons and a hint of sweetness",
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Strawberry Flavor", price: '0.99'),
        Addon(name: "Mint Leaves", price: '1.49'),
        Addon(name: "Ginger Zest", price: '1.99'),
      ],
    ),
    Food(
      name: "Iced Tea",
      imagePath: "lib/images/drinks/iced_tea_drink.png",
      price: '2.99',
      description:
          "A refreshing iced tea made with fresh lemons and a hint of sweetness",
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Peach Flavor", price: '0.99'),
        Addon(name: "Lemon Slices", price: '1.49'),
        Addon(name: "Honey", price: '1.99'),
      ],
    ),
    Food(
      name: "Smoothie",
      imagePath: "lib/images/drinks/smoothie_drink.png",
      price: '4.49',
      description:
          "A refreshing smoothie made with fresh fruits and a hint of sweetness",
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein Powder", price: '0.99'),
        Addon(name: "Almond Mix", price: '1.49'),
        Addon(name: "Chia Seeds", price: '1.99'),
      ],
    ),
    Food(
      name: "Mojito",
      imagePath: "lib/images/drinks/mojito_drink.png",
      price: '4.99',
      description:
          "A classic mojito with fresh mint, lime, and a hint of sweetness",
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Mint", price: '0.99'),
        Addon(name: "Raspberry Puree", price: '1.49'),
        Addon(name: "Splash of cocount Rum", price: '2.99'),
      ],
    ),
    Food(
      name: "Caramel Macciato",
      imagePath: "lib/images/drinks/caramel_macciato_drink.png",
      price: '4.99',
      description:
          "Indulge in our Caramel Macchiato, a decadent blend of rich espresso, steamed milk, and luxurious caramel sauce. Topped with a velvety layer of whipped cream and a delicate drizzle of caramel for the perfect sweet finish.",
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra shot of Espresso", price: '0.99'),
        Addon(name: "Hazelnut Syrup", price: '1.49'),
        Addon(name: "Whipped Cream", price: '1.99'),
      ],
    ),
  ];
  /*

G E T T E R S

*/
  List<Food> get menu => _menu;

  /*

O P E R A T I O N S

*/
  // add a cart

  // remove from cart

  // get total price of cart

  // get total number of items in cart

  // clear cart

  /*

H E L P E R S
  

*/

  // generate a receipt

  // format double value into money

  // format list of addons into a string summary
}
