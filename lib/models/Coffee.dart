import 'package:flutter/material.dart';

class Coffee {
  final String image, name, description;
  final int id;
  final double price;
  final Color bgColor;

  Coffee({
    this.image = '',
    this.name = '',
    this.description = '',
    this.price = 0.0,
    this.id = 0,
    this.bgColor = Colors.transparent,
  });
}

List<Coffee> coffeeList = [
  Coffee(
    id: 0,
    name: 'Caffe Americano',
    description:
        'Espresso shots topped with hot water create a light layer ofcrema culminating in ',
    price: 3.99,
    image: 'assets/images/coffee.png',
    bgColor: Color(0xFFCE9034),
  ),
  Coffee(
    id: 1,
    name: 'Blonde Roast Americano',
    description:
        " Light roast coffee that’s soft, mellow and flavorful. Easy-drinking on its own or with room for milk and sugar.",
    price: 3.59,
    image: 'assets/images/coffee-cup.png',
    bgColor: Color(0xFF3D82AE),
  ),
  Coffee(
    id: 2,
    name: 'Espresso',
    description:
        " Our smooth signature Espresso Roast With rich flaver and caramelly aweetness is at the heart of our signature roasts",
    price: 4.99,
    image: 'assets/images/tea-cup.png',
    bgColor: Color(0xFFCE9034),
  ),
  Coffee(
    id: 3,
    name: 'Cold Brew',
    description:
        'Cold Brew topped with lightly sweet cinnamon ,venilla syrup and almontmilk cold foam ',
    price: 4.49,
    image: 'assets/images/frappe.png',
    bgColor: Color(0xFF3D6356),
  ),
  Coffee(
    id: 4,
    name: 'Nitro Cold Brew',
    description:
        " Lightly roasted coffee that’s soft, mellow and flavorful Easy-drinking on its own or with room for milk and sugar. ",
    price: 3.59,
    image: 'assets/images/coffee-cup-1.png',
    bgColor: Color(0xFFDB657F),
  ),
  Coffee(
    id: 5,
    name: 'Esprosso',
    description:
        " Our smooth signature Espresso Roast With rich flaver and caramelly aweetness is at the heart of our signature roasts  ",
    price: 4.49,
    image: 'assets/images/take-away.png',
    bgColor: Color(0xFFC1E394),
  ),
];
