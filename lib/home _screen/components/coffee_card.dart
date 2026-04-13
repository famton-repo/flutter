import 'package:flutter/material.dart';
import 'package:famton_app/models/Coffee.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  final VoidCallback? press;
  const CoffeeCard({Key? key, required this.coffee, this.press})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: press,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(coffee.image),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
