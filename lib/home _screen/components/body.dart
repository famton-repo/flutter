import 'package:famton_app/models/Coffee.dart';
import 'package:flutter/material.dart';
import 'package:famton_app/home _screen/components/coffee_card.dart';

class Body extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 223, 180, 209),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'It’s a great day for coffee!',
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
            Categories(),
            Expanded(
              child: ListView.builder(
                itemCount: coffeeList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    CoffeeCard(coffee: coffeeList[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesStates createState() => _CategoriesStates();
}

class _CategoriesStates extends State<Categories> {
  List<String> categories = [
    'Hot Coffees',
    'Cold Coffees',
    'HotTeas',
    'Hot Drinks',
    'Iced Teas',
    'Specials',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
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
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 15.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: selectedIndex == index
                      ? Colors.black
                      : Color(0xFF27251F),
                ),
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
