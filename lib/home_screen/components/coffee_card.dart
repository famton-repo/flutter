import 'package:flutter/material.dart';
import 'package:famton_app/models/coffee.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  final VoidCallback press;

  const CoffeeCard({
    super.key,
    required this.coffee,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: coffee.id != 0 ? Colors.black26 : Colors.transparent,
        ),
        GestureDetector(
          onTap: press,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  coffee.image,
                  width: 60.0,
                ),
              ),
              const SizedBox(width: 30.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "\$${coffee.price}",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}