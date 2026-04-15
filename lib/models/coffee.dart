import 'package:flutter/material.dart';

class Coffee {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final Color bgColor;

  Coffee({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.bgColor,
  });
}

List<Coffee> coffeeList = [
  Coffee(
    id: 0,
    name: 'Caffe Americano',
    description:
        'Espresso shot topped with hot water create a light layer of crema culminating in a rich and complex flavor profile',
    price: 3.99,
    image: 'assets/images/008-coffee.png',
    bgColor: const Color(0xFFCE9034),
  ),
  Coffee(
    id: 1,
    name: 'Blonde Roast Americano',
    description:
        "Lightly roasted coffee that's soft, mellow and flavorful.Easy-drinking on its own or with room for cream and sugar.",

    price: 3.59,
    image: 'assets/images/014-coffee-cup.png',
    bgColor: const Color(0xFF3D82AE),
  ),
  Coffee(
    id: 2,
    name: 'Espresso',
    description:
        'Our smooth signature Espresso Roast with rich flavor and caramelly is at the heart of everything we do',
    price: 4.49,
    image: 'assets/images/044-tea-cup.png',
    bgColor: const Color(0xFF3D6356),
  ),
  Coffee(
    id: 3,
    name: 'Cold Brew',
    description:
        'Cold Brew topped with lightly sweet cinnamon,vanilla syrup and almondamilk cold foam',
    price: 5.99,
    image: 'assets/images/025-frappe.png',
    bgColor: const Color(0xFFC980F2),
  ),
  Coffee(
    id: 4,
    name: 'Nitro Cold Brew',
    description:
        'Lightly roasted coffee thats soft, mellow and flavorful.Easy-drinking on its own or with room',
    price: 3.59,
    image: 'assets/images/013-coffee-cup.png',
    bgColor: const Color(0xFFDB657F),
  ),

  Coffee(
    id: 5,
    name: 'Café Latte',
    description:
        'A classic combination of our rich espresso with steamed whole milk and a light layer of foam for a smooth, creamy finish.',
    price: 4.49,
    image: 'assets/images/010-take-away.png',
    bgColor: const Color(0xFFC1E394),
  ),
];
