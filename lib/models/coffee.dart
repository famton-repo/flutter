import 'package:flutter/material.dart';

class Coffee {
  final String image, name, description;
  final int id;
  final double price;
  final Color bgcolor;

  Coffee({
    this.image = '',
    this.name = '',
    this.description = '',
    this.id = 0,
    this.price = 0.0,
    this.bgcolor = Colors.transparent,
  });
}

List<Coffee> coffeeList = [
  Coffee(
    id: 0,
    name: "Caffe Americano",
    description:
        "Espresso shots topped with hot water create a light layer of crema culminating",
    image: "assets/images/008-coffee.png",
    price: 3.99,
    bgcolor: Color(0XFFCE9034),
  ),
  Coffee(
    id: 1,
    name: "Blonde Roast Americano",
    description:
        "Light roast espresso shots topped with hot water for a smooth",
    image: "assets/images/014-coffee-cup.png",
    price: 3.59,
    bgcolor: Color(0XFF3D82AE),
  ),
  Coffee(
    id: 2,
    name: "Espresso",
    description:
        "Our smooth signature Espresso Roast with a rich aroma and a hint of chocolate.",
    image: "assets/images/044-tea-cup.png",
    price: 4.49,
    bgcolor: Color(0XFF3D6356),
  ),
  Coffee(
    id: 3,
    name: "Cold brew",
    description:
        "Cold brew coffee is made by steeping coffee grounds in cold water for an extended period, typically 12-24 hours.",
    image: "assets/images/025-frappe.png",
    price: 5.99,
    bgcolor: Color(0XFFC980F2),
  ),
  Coffee(
    id: 4,
    name: "Nitro Cold brew",
    description:
        "Lightly roasted coffee beans are steeped in cold water for an extended period, typically 12-24 hours.",
    image: "assets/images/013-coffee-cup.png",
    price: 3.59,
    bgcolor: Color(0XFFDB657F),
  ),
  Coffee(
    id: 5,
    name: "Espresso",
    description:
        "Our smooth signature Espresso Roast with a rich aroma and a hint of chocolate.",
    image: "assets/images/010-take-away.png",
    price: 4.49,
    bgcolor: Color(0XFFC1E394),
  ),
];
