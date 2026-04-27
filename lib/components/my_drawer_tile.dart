import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final String text;

  const MyDrawerTile({super.key, this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onTap: onTap,
      ),
    );
  }
}
