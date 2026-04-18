import 'package:flutter/material.dart';
import 'package:famton_app/models/coffee.dart';
import 'main.dart' as main_comp;
import 'small_medium_large.dart';
import 'counter.dart';
import 'drop_down.dart';

class Body extends StatelessWidget {
  final Coffee coffee;
  const Body({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        // Bottom White Container
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.65,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0, bottom: 80.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.description,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizePicker(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Number of ${coffee.name}'s:",
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                        const Counter(),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Center(
                      child: Text(
                        "Customizations",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildCustomizationRow("Number of sugar packs:"),
                    const Divider(color: Colors.black12),
                    _buildCustomizationRow("Pumps of creamer:"),
                    const Divider(color: Colors.black12),
                    _buildCustomizationRow("Pumps of whipped cream:"),
                  ],
                ),
              ),
            ),
          ),
        ),
        
        // Top Content (Main Widget)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: main_comp.Main(coffee: coffee),
        ),
      ],
    );
  }

  Widget _buildCustomizationRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          const DropDown(),
        ],
      ),
    );
  }
}
