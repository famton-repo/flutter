import 'package:famton_app/models/food.dart';
import 'package:famton_app/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // Currently selected addons
  final Map<Addons, bool> _selectedAddons = {};

  @override
  void initState() {
    super.initState();
    // Initialise all addons as un-selected
    for (final addon in widget.food.avilableAddons) {
      _selectedAddons[addon] = false;
    }
  }

  // Add to cart and close the page
  void _addToCart() {
    final restaurant = context.read<Restaurant>();
    final selected = _selectedAddons.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();

    restaurant.addToCart(widget.food, selected);

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.food.name} added to cart!'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // ── Food image ──────────────────────────────────────────────────
          Expanded(
            child: Stack(
              children: [
                // Food image
                Image.asset(
                  widget.food.imagePath,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),

                // Back button
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.background,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Details card ────────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name & price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.food.name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                      Text(
                        '\$${widget.food.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Description
                  Text(
                    widget.food.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      height: 1.5,
                    ),
                  ),

                  // ── Add-ons ─────────────────────────────────────────────
                  if (widget.food.avilableAddons.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Text(
                      'Add-ons',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...widget.food.avilableAddons.map((addon) {
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(addon.name),
                        subtitle: Text(
                            '+\$${addon.price.toStringAsFixed(2)}'),
                        value: _selectedAddons[addon] ?? false,
                        onChanged: (val) {
                          setState(() => _selectedAddons[addon] = val ?? false);
                        },
                      );
                    }),
                  ],

                  const SizedBox(height: 24),

                  // Add to cart button
                  GestureDetector(
                    onTap: _addToCart,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
