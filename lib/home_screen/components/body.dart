import 'package:famton_app/home_screen/detail_screen/detail_screen.dart';
import 'package:famton_app/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:famton_app/home_screen/components/coffee_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF00704A),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "It's a great day for coffee",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Categories(),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: coffeeList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => CoffeeCard(
                  coffee: coffeeList[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DetailScreen(coffee: coffeeList[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  final List<String> categories = [
    'Hot Coffee',
    'Cold Coffee',
    'Hot Teas',
    'Hot Drinks',
    'Iced Teas',
    'Specials',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 15.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: selectedIndex == index
                      ? const Color(0xFF00704A)
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}