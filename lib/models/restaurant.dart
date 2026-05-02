import 'food.dart';

class Restaurant {
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
      name: "Classic Chesseburger",
      imagePath: "lib/images/burger/cheese_burger.png",
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
      name: "Classic Chesseburger",
      imagePath: "lib/images/burger/cheese_burger.png",
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
      name: "Classic Chesseburger",
      imagePath: "lib/images/burger/cheese_burger.png",
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
      name: "Classic Chesseburger",
      imagePath: "lib/images/burger/cheese_burger.png",
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

    //drinks
    Food(
      name: "Classic Chesseburger",
      imagePath: "lib/images/burger/cheese_burger.png",
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
      name: "Classic Chesseburger",
      imagePath: "lib/images/burger/cheese_burger.png",
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
      name: "Classic Chesseburger",
      imagePath: "lib/images/burger/cheese_burger.png",
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
      name: "Classic Chesseburger",
      imagePath: "lib/images/burger/cheese_burger.png",
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
      name: "Classic Chesseburger",
      imagePath: "lib/images/burger/cheese_burger.png",
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
  ];
}
