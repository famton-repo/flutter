import 'package:flutter/material.dart';
import 'package:famton_app/models/Coffee.dart';

class DetailsScreen extends StatelessWidget {
  final Coffee coffee;
  const DetailsScreen({Key? key, required this.coffee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coffee.bgColor,
      appBar: AppBar(
        backgroundColor: coffee.bgColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Text(body),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.pop(context),
          print('Added ' + coffee.name + ' to cart'),
        },
      ),
    );
  }
}
