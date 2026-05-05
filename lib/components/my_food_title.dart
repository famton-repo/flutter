import 'package:flutter/material.dart';
import 'package:famton_app/models/food.dart';
import 'package:famton_app/pages/food_page.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const MyFoodTile({
    super.key,
    required this.food,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FoodPage(food: food)),
              ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.12),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Food image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.asset(
                food.imagePath,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),

            // Details
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      food.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${food.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Add button
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
