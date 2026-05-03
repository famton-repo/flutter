import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback? onTap;
  const MyDrawerTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: icon,
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
