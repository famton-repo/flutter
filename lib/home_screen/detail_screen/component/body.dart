import 'package:flutter/material.dart';
import 'package:famton_app/models/coffee.dart';
import 'package:famton_app/home_screen/detail_screen/component/counter.dart';
import 'package:famton_app/home_screen/detail_screen/component/small_medium_large.dart';
import 'package:famton_app/home_screen/detail_screen/component/drop_down.dart';

class Body extends StatelessWidget {
  final Coffee coffee;
  const Body({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        // Hero image banner
        Container(
          width: double.infinity,
          height: size.height * 0.35,
          color: coffee.bgColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Soft circular glow behind image
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.15),
                ),
              ),
              Image.asset(
                coffee.image,
                height: 160,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),

        // Details card — fills remaining space given by Scaffold.body
        Flexible(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          coffee.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B1B1B),
                          ),
                        ),
                      ),
                      Text(
                        '\$${coffee.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00704A),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Description
                  Text(
                    coffee.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Size selector
                  const Text(
                    'Size',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SmallMediumLarge(),

                  const SizedBox(height: 24),

                  // Milk / extras dropdown
                  const Text(
                    'Milk Option',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const DropDown(),

                  const SizedBox(height: 24),

                  // Quantity counter
                  const Text(
                    'Quantity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B1B1B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Counter(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
