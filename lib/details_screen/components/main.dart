import 'package:flutter/material.dart';
import 'package:famton_app/models/Coffee.dart';

class Main extends StatelessWidget {
  const Main({Key? key, required this.coffee}) : super(key: key);
  final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hot', style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}
