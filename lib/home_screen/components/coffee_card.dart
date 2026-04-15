import 'package:flutter/material.dart';
import '../../models/coffee.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  final VoidCallback press;

  const CoffeeCard({Key? key, required this.coffee, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (coffee.id != 0)
          const Divider(color: Colors.black26, height: 1),
        GestureDetector(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Row(
              children: [
                // Coffee image with colored background
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: coffee.bgColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(coffee.image, fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(width: 14),
                // Coffee info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffee.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${coffee.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                // Arrow icon
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.white54, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
