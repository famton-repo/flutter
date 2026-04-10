import 'package:flutter/material.dart';

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
              'It’s a great day for coffe!',
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
