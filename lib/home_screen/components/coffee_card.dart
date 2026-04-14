import 'package:flutter/material.dart';
import '../../models/coffee.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  final VoidCallback press;

  const CoffeeCard({Key? key, required this.coffee, required this.press})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(color: coffee.id != 0 ? Colors.black26 : Colors.transparent),
          GestureDetector(
            onTap: press,
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(coffee.image, width: 60.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 30.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coffee.name, style: TextStyle(fontSize: 18.0)),
                Text("\$${coffee.price}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
