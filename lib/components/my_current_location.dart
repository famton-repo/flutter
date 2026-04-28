import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Deliver Now'),
        Row(
          children: [
            Text("624005 Dindigul, Tamil Nadu "),

            //dropdown menu
            Icon(Icons.keyboard_arrow_down_rounded),
          ],
        ),
      ],
    );
  }
}
