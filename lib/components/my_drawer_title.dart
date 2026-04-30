import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback? onTap;
  const MyDrawerTile({super.key,
   required this.icon,
    required this.text,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading:Icon(Icons.home),
        title: Text("Home"),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
} 