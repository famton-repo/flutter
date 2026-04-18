import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int numberOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numberOfItems > 1) {
              setState(() {
                numberOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            numberOfItems.toString().padLeft(2, 'x'),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        buildOutlineButton(
          icon: Icons.add,
          press: () {
            setState(() {
              if (numberOfItems < 9) {
                numberOfItems++;
              }
            });
          },
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({
    required IconData icon,
    required Function press,
  }) {
    return SizedBox(
      width: 25.0,
      height: 25.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press as void Function()?,
        child: Icon(icon, size: 15.0),
      ),
    );
  }
}
