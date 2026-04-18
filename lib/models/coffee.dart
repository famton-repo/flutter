import 'package:flutter/material.dart';

class Coffee {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final Color bgcolor;

  Coffee({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.bgcolor,
  });
}

List<Coffee> coffeeList = [
  Coffee(
    id: 1,
    name: 'Espresso',
    description: 'Strong and bold espresso shot.',
    image: 'assets/images/coffee.png',
    price: 3.5,
    bgcolor: Color(0xFF00704A),
  ),
  Coffee(
    id: 2,
    name: 'Cappuccino',
    description: 'Espresso with steamed milk and foam.',
    image: 'assets/images/coffee-cup.png',
    price: 4.5,
    bgcolor: Color(0xFF27251F),
  ),
  Coffee(
    id: 3,
    name: 'Classic Frappe',
    description: 'Cold and creamy blended coffee delight.',
    image: 'assets/images/frappe.png',
    price: 5.5,
    bgcolor: Color(0xFFD4A373),
  ),
  Coffee(
    id: 4,
    name: 'Classic Tea',
    description: 'Warm and soothing herbal tea.',
    image: 'assets/images/tea-cup.png',
    price: 3.0,
    bgcolor: Color(0xFFCCD5AE),
  ),
  Coffee(
    id: 5,
    name: 'Coffee To-Go',
    description: 'Quick energy boost in a travel-ready cup.',
    image: 'assets/images/take-away.png',
    price: 4.0,
    bgcolor: Color(0xFF8B4513),
  ),
  Coffee(
    id: 6,
    name: 'Latte Art',
    description: 'Beautifully crafted latte with smooth foam.',
    image: 'assets/images/coffee-cup (1).png',
    price: 5.0,
    bgcolor: Color(0xFF7B3F00),
  ),
];
